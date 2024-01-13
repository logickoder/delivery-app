import '../product_model.dart';
import 'home_datasource.dart';

/// A local data source implementation for the Home module.
class HomeLocalDatasource implements HomeDatasource {
  /// Internal storage for product data.
  final List<ProductModel> _data = [];

  /// Retrieves a list of products asynchronously.
  @override
  Future<List<ProductModel>> getProducts() async {
    return _data;
  }

  /// Saves the provided list of products to the local storage.
  void save(List<ProductModel> data) {
    _data.clear();
    _data.addAll(data);
  }
}
