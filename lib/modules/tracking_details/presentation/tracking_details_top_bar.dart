import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';

class TrackingDetailsTopBar extends StatelessWidget {
  const TrackingDetailsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: FractionallySizedBox(
        widthFactor: AppDimen.widthFactor,
        child: SizedBox(
          height: kToolbarHeight,
          child: NavigationToolbar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: color.listTitle,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            middle: Text(
              'Tracking details',
              style: TextStyle(
                fontSize: 18,
                color: color.title,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
