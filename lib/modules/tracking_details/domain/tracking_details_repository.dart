import '../data/tracking_detail_model.dart';

/// Repository for retrieving tracking details.
abstract class TrackingDetailsRepository {
  /// Get tracking details for the specified [receiptNumber].
  Future<TrackingDetailModel> getDetail(String receiptNumber);
}
