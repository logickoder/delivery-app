import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../shared/widgets/button.dart';

class OrdersReceiptInput extends StatelessWidget {
  const OrdersReceiptInput({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return FractionallySizedBox(
        widthFactor: AppDimen.widthFactor,
        child: AspectRatio(
          aspectRatio: 327 / 308,
          child: Container(
            decoration: BoxDecoration(
              color: color.primary,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AppAsset.ordersTopRightIcon),
                ),
                Align(
                  alignment: Alignment.center,
                  child: LayoutBuilder(builder: (_, constraints) {
                    return SizedBox(
                      width: AppDimen.widthFactor * constraints.maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: constraints.maxHeight * .18),
                          Text(
                            'Track Your Package',
                            style: TextStyle(
                              fontSize: 18,
                              color: color.primaryTitle,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * .03),
                          SizedBox(
                            width: constraints.maxWidth * .9,
                            child: Text(
                              'Enter the receipt number that has been given by the officer',
                              style: TextStyle(
                                color: color.onPrimary,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter the receipt number',
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * .03),
                          const ActionButton(text: 'Track Now'),
                          SizedBox(height: constraints.maxHeight * .1),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
