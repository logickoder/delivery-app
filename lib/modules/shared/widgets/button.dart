import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/theme.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ActionButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w600,
                color: AppColor.of(context).background,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SvgPicture.asset(AppAsset.arrowRightIcon),
        ],
      ),
    );
  }
}
