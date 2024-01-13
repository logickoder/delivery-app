import 'package:delivery_app/modules/orders/data/order_model.dart';
import 'package:delivery_app/modules/orders/domain/get_order_tracking_history_usecase.dart';
import 'package:delivery_app/modules/orders/domain/orders_repository.dart';
import 'package:delivery_app/modules/orders/presentation/orders_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrdersViewModel', () {
    test('getTrackingHistory updates loading and history', () async {
      final getOrderTrackingHistoryUsecase = GetOrderTrackingHistoryUsecase(
        MockOrdersRepository(),
      );
      final ordersViewModel = OrdersViewModel(getOrderTrackingHistoryUsecase);

      await ordersViewModel.getTrackingHistory();

      expect(ordersViewModel.loading.value, isFalse);
      expect(ordersViewModel.history.value, isNotEmpty);
    });
  });
}

class MockOrdersRepository extends OrdersRepository {
  @override
  Future<List<OrderModel>> getOrders() async {
    return const [
      OrderModel(title: 'Order 1', progress: 'In delivery'),
      OrderModel(title: 'Order 2', progress: 'In progress'),
    ];
  }
}
