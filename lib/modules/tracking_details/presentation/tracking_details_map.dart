import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app/theme.dart';
import '../../../core/presentation/view_model_provider.dart';
import 'tracking_details_view_model.dart';

class TrackingDetailsMap extends StatelessWidget {
  static const _initialPosition = CameraPosition(
    target: LatLng(6.510977, 3.388195),
    zoom: 16,
  );

  const TrackingDetailsMap({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModelProvider.of<TrackingDetailsViewModel>(context);
    return ListenableBuilder(
      listenable: viewModel.state,
      builder: (_, __) {
        final loading = viewModel.loading.value;
        final mapStyle = viewModel.mapStyle.value;
        final (markers, polyline) = viewModel.route.value;

        if (loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final Set<Polyline> polylines = {};
        if (polyline != null) {
          polylines.add(
            polyline.copyWith(
              colorParam: AppColor.of(context).primary,
            ),
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
    );
  }
}
