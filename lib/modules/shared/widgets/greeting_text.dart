import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    final String text;
    final hour = DateTime.now().hour;
    if (hour < 12) {
      text = 'Morning';
    } else if (hour < 18) {
      text = 'Afternoon';
    } else {
      text = 'Evening';
    }

    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 40),
      child: FractionallySizedBox(
        widthFactor: AppDimen.widthFactor,
        child: Text(
          'Hello, Good $text',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.of(context).title,
          ),
        ),
      ),
    );
  }
}
