import 'order_model.dart';

/// A class for retrieving remote order data.
class OrderRemoteDatasource {
  /// Fetches a list of orders from the remote data source.
  Future<List<OrderModel>> getOrders() async {
    // Simulate a delay, representing the time it takes to fetch data remotely.
    await Future.delayed(const Duration(seconds: 1));

    // Generate a list of dummy orders for testing purposes.
    return List.generate(20, (index) {
      return OrderModel(
        title: 'SCP93748264${70 + index}',
        progress: index % 2 == 0 ? 'In the process' : 'In delivery',
      );
    });
  }
}
