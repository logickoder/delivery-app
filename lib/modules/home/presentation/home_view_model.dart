import 'package:flutter/foundation.dart';

import '../../../core/presentation/base_view_model.dart';
import '../data/home_repository_impl.dart';
import '../domain/get_product_images_usecase.dart';

/// A view model for the home screen .
class HomeViewModel extends BaseViewModel {
  final GetProductImagesUsecase _getProductImages;

  HomeViewModel(this._getProductImages);

  /// Notifier for tracking the loading state.
  final _loading = ValueNotifier<bool>(false);

  /// Provides a [ValueListenable] for observing the loading state.
  ValueListenable<bool> get loading => _loading;

  /// Notifier for tracking the list of product images.
  final _images = ValueNotifier<List<String>>([]);

  /// Provides a [ValueListenable] for observing the list of product images.
  ValueListenable<List<String>> get images => _images;

  /// Combines [_loading] and [_images] into a single [Listenable] for general state observation.
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
