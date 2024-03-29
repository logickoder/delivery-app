import '../product_model.dart';
import 'home_datasource.dart';

/// A class that implements the [HomeDatasource] interface for retrieving product data remotely.
class HomeRemoteDatasource implements HomeDatasource {
  @override
  Future<List<ProductModel>> getProducts() async {
    // Simulates a delay of 2 seconds to mimic a network request.
    await Future.delayed(const Duration(seconds: 2));

    final productImageUrls = [
      'https://radshop-usedom.de/wp-content/uploads/2021/12/RAY_21_CrossRay_E_FS_6.0_oblique_web.png',
      'https://e7.pngegg.com/pngimages/355/25/png-clipart-camcorder-canon-xm2-product-manuals-video-digital-audio-tape-restoration-angle-camera-lens.png',
      'https://e7.pngegg.com/pngimages/398/672/png-clipart-gray-acer-laptop-laptop-laptop-notebook-electronics-gadget.png',
      'https://e7.pngegg.com/pngimages/986/690/png-clipart-microphone-microphone-gadget-electronics.png',
      'https://e7.pngegg.com/pngimages/969/417/png-clipart-red-beats-by-dr-dre-wireless-headphones-headphones-beats-electronics-microphone-sound-disc-jockey-headphone-electronics-recording-studio.png',
      'https://e7.pngegg.com/pngimages/52/498/png-clipart-headphones-audio-apple-earbuds-mobile-phones-microphone-headphones-electronics-cable.png',
    ];

    return productImageUrls.map((e) => ProductModel(image: e)).toList();
  }
}
