import '../product_model.dart';
import 'home_datasource.dart';

/// A datasource for getting products from a remote server
class HomeRemoteDatasource implements HomeDatasource {
  @override
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      6,
      (index) => ProductModel(image: 'https://picsum.photos/${300 + index}'),
    );
  }
}
