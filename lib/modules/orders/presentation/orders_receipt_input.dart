import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../shared/widgets/button.dart';
import '../../tracking_details/presentation/tracking_details_screen.dart';

class OrdersReceiptInput extends StatefulWidget {
  const OrdersReceiptInput({super.key});

  @override
  State<OrdersReceiptInput> createState() => _OrdersReceiptInputState();
}

class _OrdersReceiptInputState extends State<OrdersReceiptInput> {
  final _controller = TextEditingController();

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
                        TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Enter the receipt number',
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * .03),
                        ActionButton(text: 'Track Now', onPressed: _onTrackNow),
                        SizedBox(height: constraints.maxHeight * .1),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTrackNow() {
    final receiptNumber = _controller.text;
    if (receiptNumber.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).pushNamed(
        TrackingDetailsScreen.id,
        arguments: receiptNumber,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the receipt number')),
      );
    }
  }
}
