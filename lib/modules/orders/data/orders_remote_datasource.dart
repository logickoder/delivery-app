import 'order_model.dart';

class OrderRemoteDatasource {
  Future<List<OrderModel>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(20, (index) {
      return OrderModel(
        title: 'SCP93748264${70 + index}',
        progress: index % 2 == 0 ? 'In the process' : 'In delivery',
      );
    });
  }
}
