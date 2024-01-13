import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingDetailsEntity {
  final List<LatLng> route;

  const TrackingDetailsEntity({
    required this.route,
  });
}
