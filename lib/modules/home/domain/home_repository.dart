import '../data/product_model.dart';

/// Abstract class for home repository, providing methods to fetch products.
abstract class HomeRepository {
  Future<List<ProductModel>> getProducts();
}
