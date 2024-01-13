import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';

class TrackingDetailsInput extends StatelessWidget {
  final String _value;

  const TrackingDetailsInput(this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: AppDimen.widthFactor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.of(context).primary,
          borderRadius: BorderRadius.circular(46),
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          initialValue: _value,
          readOnly: true,
        ),
      ),
    );
  }
}
