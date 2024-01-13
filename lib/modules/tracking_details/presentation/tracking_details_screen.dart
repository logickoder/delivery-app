import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app/theme.dart';
import 'tracking_details_input.dart';
import 'tracking_details_top_bar.dart';
import 'tracking_details_view_model.dart';

class TrackingDetailsScreen extends StatefulWidget {
  static const id = '/orders/tracking';

  const TrackingDetailsScreen({super.key});

  @override
  State<TrackingDetailsScreen> createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  final _viewModel = getTrackingDetailsViewModel();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.init(_receiptNumber, context);
    });
    super.initState();
  }

  static const _initialPosition = CameraPosition(
    target: LatLng(6.510977, 3.388195),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            ListenableBuilder(
              listenable: _viewModel.state,
              builder: (_, __) {
                final loading = _viewModel.loading.value;
                final mapStyle = _viewModel.mapStyle.value;
                final (markers, polyline) = _viewModel.route.value;

                if (loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final Set<Polyline> polylines = {};
                if (polyline != null) {
                  polylines.add(
                    polyline.copyWith(colorParam: AppColor.of(context).primary),
                  );
                }

                return GoogleMap(
                  initialCameraPosition: _initialPosition,
                  zoomControlsEnabled: false,
                  markers: markers,
                  polylines: polylines,
                  onMapCreated: (controller) {
                    controller.setMapStyle(mapStyle);
                  },
                );
              },
            ),
            SafeArea(
              child: Column(
                children: [
                  const TrackingDetailsTopBar(),
                  const SizedBox(height: 49),
                  TrackingDetailsInput(_receiptNumber),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _receiptNumber =>
      ModalRoute.of(context)!.settings.arguments as String;
}
