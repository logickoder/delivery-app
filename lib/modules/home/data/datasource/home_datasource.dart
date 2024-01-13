import '../product_model.dart';

abstract class HomeDatasource {
  Future<List<ProductModel>> getProducts();
}
