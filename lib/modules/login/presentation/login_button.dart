import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/theme.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.background,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(AppAsset.googleIcon),
          ),
          Expanded(
            child: Text(
              'Login with Google',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.background,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}