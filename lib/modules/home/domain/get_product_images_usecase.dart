import 'dart:ffi';

import '../../../core/domain/base_usecase.dart';
import 'home_repository.dart';

class GetProductImagesUsecase implements BaseUseCase<List<String>, Void> {
  const GetProductImagesUsecase(this._repository);

  final HomeRepository _repository;

  @override
  Future<List<String>> call([Void? value]) async {
    final products = await _repository.getProducts();
    return products.map((e) => e.image).toList();
  }
}
