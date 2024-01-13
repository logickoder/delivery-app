import 'package:flutter/foundation.dart';

import '../../../core/presentation/base_view_model.dart';
import '../data/orders_repository_impl.dart';
import '../domain/get_order_tracking_history_usecase.dart';
import '../domain/order_tracking_history_entity.dart';

class OrdersViewModel implements BaseViewModel {
  final GetOrderTrackingHistoryUsecase _getOrdersTrackingHistory;

  OrdersViewModel(this._getOrdersTrackingHistory);

  final _loading = ValueNotifier<bool>(false);

  ValueListenable<bool> get loading => _loading;

  final _history = ValueNotifier<List<OrderTrackingHistoryEntity>>([]);

  ValueListenable<List<OrderTrackingHistoryEntity>> get history => _history;

  late final Listenable state = Listenable.merge([_loading, _history]);

  Future<void> getTrackingHistory() async {
    try {
      _loading.value = true;
      _history.value = await _getOrdersTrackingHistory();
    } finally {
      _loading.value = false;
    }
  }
}

OrdersViewModel getOrdersViewModel() => OrdersViewModel(
      GetOrderTrackingHistoryUsecase(OrdersRepositoryImpl()),
    );
