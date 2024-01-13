import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app/theme.dart';
import '../../../core/presentation/view_model_provider.dart';
import '../../shared/widgets/greeting_text.dart';
import '../../shared/widgets/top_bar.dart';
import 'orders_receipt_input.dart';
import 'orders_tracking_history.dart';
import 'orders_view_model.dart';

class OrdersScreen extends StatefulWidget {
  static const id = '/orders';

  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _viewModel = getOrdersViewModel();

  @override
  void initState() {
    Future.delayed(Duration.zero, _viewModel.getTrackingHistory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColor.of(context).background,
        ),
        child: ViewModelProvider(
          _viewModel,
          child: const SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                TopBar(),
                SliverToBoxAdapter(child: GreetingText()),
                SliverToBoxAdapter(child: OrdersReceiptInput()),
                SliverPadding(
                  padding: EdgeInsets.only(top: 40, bottom: 16),
                  sliver:
                      SliverToBoxAdapter(child: OrdersTrackingHistoryTitle()),
                ),
                OrdersTrackingHistory(),
                SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
