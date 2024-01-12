import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';

class HistoryItem extends StatelessWidget {
  final String title;
  final FontWeight titleWeight;
  final String subtitle;
  final String icon;
  final Color iconBackground;
  final Widget trailing;

  const HistoryItem({
    super.key,
    required this.title,
    required this.titleWeight,
    required this.subtitle,
    required this.icon,
    required this.iconBackground,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return FractionallySizedBox(
      widthFactor: AppDimen.widthFactor,
      child: LayoutBuilder(builder: (_, constraints) {
        final iconSize = constraints.maxWidth * .18;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(iconSize),
              ),
              child: Center(
                child: Text(
                  icon,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(width: constraints.maxWidth * .05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: titleWeight, color: color.sectionTitle),
                  ),
                  const SizedBox(height: 8),
                  Text(subtitle),
                ],
              ),
            ),
            trailing,
          ],
        );
      }),
    );
  }
}
