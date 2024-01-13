import '../tracking_detail_model.dart';

abstract class TrackingDetailsDatasource {
  /// Get tracking details for [receiptNumber]
  Future<TrackingDetailModel?> getDetail(String receiptNumber);
}
