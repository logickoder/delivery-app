import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app/asset.dart';
import '../../../core/presentation/base_view_model.dart';
import '../data/tracking_details_repository_impl.dart';
import '../domain/get_product_positions_usecase.dart';

class TrackingDetailsViewModel extends BaseViewModel {
  final GetProductPositionsUsecase _getProductPositions;

  TrackingDetailsViewModel(this._getProductPositions);

  final _loading = ValueNotifier<bool>(false);

  ValueListenable<bool> get loading => _loading;

  final _mapStyle = ValueNotifier<String?>(null);

  ValueListenable<String?> get mapStyle => _mapStyle;

  final _route = ValueNotifier<(Set<Marker>, Polyline?)>(({}, null));

  ValueListenable<(Set<Marker>, Polyline?)> get route => _route;

  late final Listenable state = Listenable.merge([_loading, _mapStyle, _route]);

  Future<void> init(String receiptNumber, BuildContext context) async {
    try {
      _loading.value = true;
      await Future.wait(
          [_getMapStyle(), _getPositions(receiptNumber, context)]);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> _getMapStyle() async {
    final style = await rootBundle.loadString(AppAsset.googleMapStyingRaw);
    _mapStyle.value = style;
  }

  Future<void> _getPositions(String receiptNumber, BuildContext context) async {
    final positions = await _getProductPositions(receiptNumber);
    if (!context.mounted) {
      return;
    }

    final mapStart = _getBitmapDescriptorFromSvgAsset(
      AppAsset.mapStartIcon,
      context: context,
      size: const Size.square(16),
    );
    final mapEnd = _getBitmapDescriptorFromSvgAsset(
      AppAsset.mapEndIcon,
      context: context,
    );
    // make sure the markers are drawn on the center of the start and end of the polyline
    const anchor = Offset(0.5, 0.5);
    _route.value = (
      {
        Marker(
          markerId: const MarkerId('start'),
          position: positions.route.first,
          icon: await mapStart,
          anchor: anchor,
        ),
        Marker(
          markerId: const MarkerId('end'),
          position: positions.route.last,
          icon: await mapEnd,
          anchor: anchor,
        ),
      },
      Polyline(
        polylineId: const PolylineId('route'),
        points: positions.route,
        width: 5,
        jointType: JointType.round,
      ),
    );
  }

  Future<BitmapDescriptor> _getBitmapDescriptorFromSvgAsset(
    String assetName, {
    required BuildContext context,
    Size size = const Size(48, 48),
  }) async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

    if (!context.mounted) {
      throw Exception('Context is not mounted');
    }

    final devicePixelRatio = View.of(context).devicePixelRatio;
    final width = (size.width * devicePixelRatio).toInt();
    final height = (size.height * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();

    ui.Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }
}

TrackingDetailsViewModel getTrackingDetailsViewModel() =>
    TrackingDetailsViewModel(
      GetProductPositionsUsecase(TrackingDetailsRepositoryImpl()),
    );
