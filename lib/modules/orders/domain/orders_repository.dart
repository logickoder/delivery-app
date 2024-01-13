import '../data/order_model.dart';

/// Represents a repository for managing orders.
///
/// Implementations of this abstract class should provide the functionality
/// to retrieve a list of [OrderModel] objects.
abstract class OrdersRepository {
  /// Fetches a list of orders.
  Future<List<OrderModel>> getOrders();
}
