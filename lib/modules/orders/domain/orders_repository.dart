import '../data/order_model.dart';

abstract class OrdersRepository {
  Future<List<OrderModel>> getOrders();
}
