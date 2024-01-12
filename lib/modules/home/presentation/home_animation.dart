import 'package:flutter/material.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/theme.dart';

class HomeAnimation extends StatelessWidget {
  const HomeAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 43,
          child: Image.asset(AppAsset.ridingAnimation),
        ),
        Expanded(
          flex: 47,
          child: Text(
            'You too can join our Elite squad of E-bikers',
            style: TextStyle(
              color: AppColor.of(context).onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
