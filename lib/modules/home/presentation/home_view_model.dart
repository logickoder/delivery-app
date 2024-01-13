import 'package:flutter/foundation.dart';

import '../../../core/presentation/base_view_model.dart';
import '../data/home_repository_impl.dart';
import '../domain/get_product_images_usecase.dart';

class HomeViewModel extends BaseViewModel {
  final GetProductImagesUsecase _getProductImages;

  HomeViewModel(this._getProductImages);

  final _loading = ValueNotifier<bool>(false);

  ValueListenable<bool> get loading => _loading;

  final _images = ValueNotifier<List<String>>([]);

  ValueListenable<List<String>> get images => _images;

  late final Listenable state = Listenable.merge([_loading, _images]);

  Future<void> getProductImages() async {
    try {
      _loading.value = true;
      _images.value = await _getProductImages();
    } finally {
      _loading.value = false;
    }
  }
}

HomeViewModel getHomeViewModel() => HomeViewModel(
      GetProductImagesUsecase(HomeRepositoryImpl()),
    );
