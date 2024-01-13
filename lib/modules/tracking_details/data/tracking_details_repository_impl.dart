import '../domain/tracking_details_repository.dart';
import 'datasource/tracking_details_local_datasource.dart';
import 'datasource/tracking_details_remote_datasource.dart';
import 'tracking_detail_model.dart';

/// A repository implementation for managing tracking details.
///
/// This class implements the [TrackingDetailsRepository] interface and provides
/// methods to retrieve tracking details. It utilizes both a remote data source
/// ([TrackingDetailsRemoteDatasource]) and a local data source
/// ([TrackingDetailsLocalDatasource]) for efficient data retrieval.
class TrackingDetailsRepositoryImpl implements TrackingDetailsRepository {
  final _remote = TrackingDetailsRemoteDatasource();
  final _local = TrackingDetailsLocalDatasource();

  TrackingDetailsRepositoryImpl._();

  /// Singleton instance of [TrackingDetailsRepositoryImpl].
  static final _instance = TrackingDetailsRepositoryImpl._();

  /// Factory method to obtain the singleton instance of [TrackingDetailsRepositoryImpl].
  factory TrackingDetailsRepositoryImpl() => _instance;

  /// Retrieves tracking details for the given receipt number.
  ///
  /// First, it attempts to fetch the details from the local data source.
  /// If not found locally, it then retrieves the details from the remote
  /// data source and adds them to the local data source for future use.
  ///
  /// Returns a [TrackingDetailModel] representing the tracking details.
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
