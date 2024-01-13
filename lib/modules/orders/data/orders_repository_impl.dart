import '../domain/orders_repository.dart';
import 'order_model.dart';
import 'orders_remote_datasource.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final _datasource = OrderRemoteDatasource();

  @override
  Future<List<OrderModel>> getOrders() => _datasource.getOrders();
}
