import '../data/product_model.dart';

abstract class HomeRepository {
  Future<List<ProductModel>> getProducts();
}
