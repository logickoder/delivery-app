import '../domain/tracking_details_repository.dart';
import 'datasource/tracking_details_local_datasource.dart';
import 'datasource/tracking_details_remote_datasource.dart';
import 'tracking_detail_model.dart';

class TrackingDetailsRepositoryImpl implements TrackingDetailsRepository {
  final _remote = TrackingDetailsRemoteDatasource();
  final _local = TrackingDetailsLocalDatasource();

  TrackingDetailsRepositoryImpl._();

  static final _instance = TrackingDetailsRepositoryImpl._();

  factory TrackingDetailsRepositoryImpl() => _instance;

  @override
  Future<TrackingDetailModel> getDetail(String receiptNumber) async {
    var data = await _local.getDetail(receiptNumber);
    if (data == null) {
      data = await _remote.getDetail(receiptNumber);
      _local.addDetail(data);
    }
    return data;
  }
}
