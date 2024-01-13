import '../domain/home_repository.dart';
import 'datasource/home_local_datasource.dart';
import 'datasource/home_remote_datasource.dart';
import 'product_model.dart';

/// Repository for managing home-related data, implementing [HomeRepository].
class HomeRepositoryImpl implements HomeRepository {
  final _remote = HomeRemoteDatasource();
  final _local = HomeLocalDatasource();

  HomeRepositoryImpl._();

  static final _instance = HomeRepositoryImpl._();

  factory HomeRepositoryImpl() => _instance;

  /// Retrieves a list of [ProductModel] asynchronously.
  ///
  /// If local data is available, it is returned; otherwise, remote data is fetched.
  /// Retrieved data is also cached locally for future use.
  @override
  Future<List<ProductModel>> getProducts() async {
    var data = await _local.getProducts();
    if (data.isEmpty) {
      data = await _remote.getProducts();
      _local.save(data);
    }
    return data;
  }
}
