import '../data/tracking_detail_model.dart';

abstract class TrackingDetailsRepository {
  /// Get tracking details for [receiptNumber]
  Future<TrackingDetailModel> getDetail(String receiptNumber);
}
