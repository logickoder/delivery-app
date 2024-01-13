import '../domain/orders_repository.dart';
import 'order_model.dart';
import 'orders_remote_datasource.dart';

/// A concrete implementation of [OrdersRepository] that fetches orders
/// from a remote data source.
class OrdersRepositoryImpl implements OrdersRepository {
  /// The remote data source used for fetching orders.
  final _datasource = OrderRemoteDatasource();

  /// Retrieves a list of [OrderModel] objects representing orders.
  @override
  Future<List<OrderModel>> getOrders() => _datasource.getOrders();
}
