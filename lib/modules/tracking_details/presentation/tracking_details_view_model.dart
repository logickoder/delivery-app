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
import '../domain/entity/tracking_detail.dart';
import '../domain/usecase/get_product_positions.dart';
import '../domain/usecase/get_tracking_detail.dart';

class TrackingDetailsViewModel extends BaseViewModel {
  final GetParcelRouteUsecase _getParcelRoute;
  final GetTrackingDetailUsecase _getTrackingDetail;

  TrackingDetailsViewModel(this._getParcelRoute, this._getTrackingDetail);

  final _loading = ValueNotifier<bool>(false);

  ValueListenable<bool> get loading => _loading;

  final _mapStyle = ValueNotifier<String?>(null);

  ValueListenable<String?> get mapStyle => _mapStyle;

  final _route = ValueNotifier<(Set<Marker>, Polyline?)>(({}, null));

  ValueListenable<(Set<Marker>, Polyline?)> get route => _route;

  final _detail = ValueNotifier<TrackingDetailEntity?>(null);

  ValueListenable<TrackingDetailEntity?> get detail => _detail;

  late final Listenable state = Listenable.merge([
    _loading,
    _mapStyle,
    _route,
    _detail,
  ]);

  Future<void> init(String receiptNumber, BuildContext context) async {
    try {
      _loading.value = true;
      await Future.wait(
        [
          _getMapStyle(),
          _getRoute(receiptNumber, context),
        ],
      );
      // get route already polls the remote datasource and saves the result to the local datasource
      // so calling this method will not make another network call
      // and since we don't want to have race conditions, we make sure to call this method after _getRoute
      await _getDetail(receiptNumber);
    } finally {
      _loading.value = false;
    }
  }

  /// Retrieves map styling from the app's assets.
  Future<void> _getMapStyle() async {
    final style = await rootBundle.loadString(AppAsset.googleMapStyingRaw);
    _mapStyle.value = style;
  }

  /// Retrieves route information and sets markers and polyline.
  Future<void> _getRoute(String receiptNumber, BuildContext context) async {
    final positions = await _getParcelRoute(receiptNumber);
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

  /// Retrieves tracking details for the given receiptNumber.
  Future<void> _getDetail(String receiptNumber) async {
    _detail.value = await _getTrackingDetail(receiptNumber);
  }

  /// Converts an SVG asset to a BitmapDescriptor for map markers.
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
      GetParcelRouteUsecase(TrackingDetailsRepositoryImpl()),
      GetTrackingDetailUsecase(TrackingDetailsRepositoryImpl()),
    );
