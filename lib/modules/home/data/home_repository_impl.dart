import '../domain/home_repository.dart';
import 'datasource/home_local_datasource.dart';
import 'datasource/home_remote_datasource.dart';
import 'product_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _remote = HomeRemoteDatasource();
  final _local = HomeLocalDatasource();

  HomeRepositoryImpl._();

  static final _instance = HomeRepositoryImpl._();

  factory HomeRepositoryImpl() => _instance;

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
