import 'package:delivery_app/modules/home/data/product_model.dart';
import 'package:delivery_app/modules/home/domain/get_product_images_usecase.dart';
import 'package:delivery_app/modules/home/domain/home_repository.dart';
import 'package:delivery_app/modules/home/presentation/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeViewModel', () {
    test('getProductImages updates loading and images', () async {
      final mockUsecase = GetProductImagesUsecase(MockRepository());
      final viewModel = HomeViewModel(mockUsecase);

      expect(viewModel.loading.value, false);
      expect(viewModel.images.value, isEmpty);

      await viewModel.getProductImages();

      expect(viewModel.loading.value, false);
      expect(viewModel.images.value, isNotEmpty);
    });
  });
}

/// A mock repository for testing purposes.
class MockRepository extends HomeRepository {
  @override
  Future<List<ProductModel>> getProducts() async {
    return const [
      ProductModel(image: 'image1.jpg'),
      ProductModel(image: 'image2.jpg'),
    ];
  }
}
