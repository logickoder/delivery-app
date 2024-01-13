import '../tracking_detail_model.dart';
import 'tracking_details_datasource.dart';

/// Local data source for tracking details, implementing [TrackingDetailsDatasource].
class TrackingDetailsLocalDatasource implements TrackingDetailsDatasource {
  /// Internal storage for tracking details, indexed by receipt number.
  final Map<String, TrackingDetailModel> _data = {};

  /// Retrieves tracking details for the specified receipt number.
  @override
  Future<TrackingDetailModel?> getDetail(String receiptNumber) async {
    return _data[receiptNumber];
  }

  /// Adds tracking details to the local data source.
  void addDetail(TrackingDetailModel detail) {
    _data[detail.receiptNumber] = detail;
  }
}
