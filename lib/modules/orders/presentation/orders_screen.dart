import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app/theme.dart';
import '../../shared/widgets/greeting_text.dart';
import '../../shared/widgets/top_bar.dart';
import 'orders_receipt_input.dart';
import 'orders_tracking_history.dart';

class OrdersScreen extends StatelessWidget {
  static const id = '/orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColor.of(context).background,
        ),
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
                sliver: SliverToBoxAdapter(child: OrdersTrackingHistoryTitle()),
              ),
              OrdersTrackingHistory(),
              SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
