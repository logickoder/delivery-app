import 'dart:ffi';

import '../../../core/domain/base_usecase.dart';
import 'order_tracking_history_entity.dart';
import 'orders_repository.dart';

class GetOrderTrackingHistoryUsecase
    implements BaseUseCase<List<OrderTrackingHistoryEntity>, Void> {
  const GetOrderTrackingHistoryUsecase(this._repository);

  final OrdersRepository _repository;

  @override
  Future<List<OrderTrackingHistoryEntity>> call([Void? value]) async {
    final orders = await _repository.getOrders();
    return orders
        .map(
          (e) => OrderTrackingHistoryEntity(
            title: e.title,
            progress: e.progress,
          ),
        )
        .toList();
  }
}
