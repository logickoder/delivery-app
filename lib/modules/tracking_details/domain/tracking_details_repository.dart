import 'tracking_details_entity.dart';

abstract class TrackingDetailsRepository {
  /// Get tracking details for [receiptNumber]
  Future<TrackingDetailsEntity> getDetail(String receiptNumber);
}
