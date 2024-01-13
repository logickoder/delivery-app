import '../product_model.dart';

/// Abstract class for home data source.
abstract class HomeDatasource {
  /// Fetches a list of [ProductModel].
  Future<List<ProductModel>> getProducts();
}
