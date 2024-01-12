import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../shared/widgets/button.dart';

class HomeCallToAction extends StatelessWidget {
  const HomeCallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 109,
      child: Container(
        color: AppColor.of(context).primary,
        child: FractionallySizedBox(
          widthFactor: AppDimen.widthFactor,
          child: Row(
            children: [
              Expanded(
                flex: 34,
                child: Text(
                  'Gotten your E-Bike yet?',
                  style: TextStyle(
                    color: AppColor.of(context).onPrimary,
                  ),
                ),
              ),
              const Spacer(flex: 9),
              const Expanded(
                  flex: 52, child: ActionButton(text: 'Your Orders')),
            ],
          ),
        ),
      ),
    );
  }
}
