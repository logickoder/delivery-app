import '../product_model.dart';
import 'home_datasource.dart';

/// An in memory datasource for products
class HomeLocalDatasource implements HomeDatasource {
  final List<ProductModel> _data = [];

  @override
  Future<List<ProductModel>> getProducts() async {
    return _data;
  }

  void save(List<ProductModel> data) {
    _data.clear();
    _data.addAll(data);
  }
}
