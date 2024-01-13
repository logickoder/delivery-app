import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../../core/presentation/view_model_provider.dart';
import '../../shared/widgets/history_item.dart';
import '../../tracking_details/presentation/tracking_details_screen.dart';
import 'orders_view_model.dart';

class OrdersTrackingHistoryTitle extends StatelessWidget {
  const OrdersTrackingHistoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: AppDimen.widthFactor,
      child: Text(
        'Tracking history',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.of(context).listTitle,
        ),
      ),
    );
  }
}

class OrdersTrackingHistory extends StatelessWidget {
  const OrdersTrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModelProvider.of<OrdersViewModel>(context);
    final color = AppColor.of(context);
    final rightIcon = Icon(
      Icons.arrow_forward_ios,
      color: color.sectionTitle,
      size: 12,
    );

    return ListenableBuilder(
      listenable: viewModel.state,
      builder: (_, __) {
        final loading = viewModel.loading.value;
        final history = viewModel.history.value;

        if (loading) {
          const SliverToBoxAdapter(
            child: Center(child: RefreshProgressIndicator()),
          );
        }

        return SliverList.separated(
          itemBuilder: (_, index) {
            final data = history[index];
            return GestureDetector(
              onTap: () => _navigateToTrackingDetails(context, data.title),
              child: HistoryItem(
                title: data.title,
                titleWeight: FontWeight.w500,
                subtitle: data.progress,
                icon: _icon(data.progress),
                iconBackground: color.card,
                trailing: rightIcon,
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: history.length,
        );
      },
    );
  }

  String _icon(String title) {
    return title == 'In the process' ? '📦' : '🚚';
  }

  void _navigateToTrackingDetails(BuildContext context, String receiptNumber) {
    Navigator.of(context, rootNavigator: true).pushNamed(
      TrackingDetailsScreen.id,
      arguments: receiptNumber,
    );
  }
}
