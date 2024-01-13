import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Represents a tracking detail route entity with a list of geographical points.
class TrackingDetailRouteEntity {
  /// List of geographical points defining the route.
  final List<LatLng> route;

  const TrackingDetailRouteEntity({required this.route});
}
