import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../shared/widgets/history_item.dart';

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
    final color = AppColor.of(context);
    final rightIcon =
        Icon(Icons.arrow_forward_ios, color: color.sectionTitle, size: 12);

    return SliverList.separated(
      itemBuilder: (_, index) {
        final data = _data[index];
        return HistoryItem(
          title: data.$1,
          titleWeight: FontWeight.w500,
          subtitle: data.$2,
          icon: _icon(data.$2),
          iconBackground: color.card,
          trailing: rightIcon,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: _data.length,
    );
  }

  String _icon(String title) {
    return title == 'In the process' ? '📦' : '🚚';
  }
}

final List<(String, String)> _data = List.generate(10, (index) {
  return (
    'SCP93748264${70 + index}',
    index % 2 == 0 ? 'In the process' : 'In delivery',
  );
});
