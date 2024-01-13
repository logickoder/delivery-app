import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/tracking_details_entity.dart';
import '../domain/tracking_details_repository.dart';
import 'tracking_details_remote_datasource.dart';

class TrackingDetailsRepositoryImpl implements TrackingDetailsRepository {
  final _datasource = TrackingDetailsRemoteDatasource();

  @override
  Future<TrackingDetailsEntity> getDetail(String receiptNumber) async {
    final data = await _datasource.getDetails(receiptNumber);
    return TrackingDetailsEntity(
      route: data.route.map((e) => LatLng(e.first, e.last)).toList(),
    );
  }
}
