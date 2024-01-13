import '../tracking_detail_model.dart';

/// Abstract class for a datasource that provides tracking details.
abstract class TrackingDetailsDatasource {
  /// Get tracking details for [receiptNumber]
  Future<TrackingDetailModel?> getDetail(String receiptNumber);
}
