import '../tracking_detail_model.dart';
import 'tracking_details_datasource.dart';

/// An in memory datasource for tracking details
class TrackingDetailsLocalDatasource implements TrackingDetailsDatasource {
  final Map<String, TrackingDetailModel> _data = {};

  @override
  Future<TrackingDetailModel?> getDetail(String receiptNumber) async {
    return _data[receiptNumber];
  }

  void addDetail(TrackingDetailModel detail) {
    _data[detail.receiptNumber] = detail;
  }
}
