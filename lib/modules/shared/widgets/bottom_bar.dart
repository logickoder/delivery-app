import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexSelected,
  });

  final int selectedIndex;
  final void Function(int) onIndexSelected;

  static const icons = [
    AppAsset.homeIcon,
    AppAsset.bookmarkIcon,
    AppAsset.chatIcon,
    AppAsset.settingsIcon,
  ];

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return Container(
      color: color.card,
      padding: const EdgeInsets.only(top: 24, bottom: 32),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: icons.mapIndexed(
            (index, icon) {
              return GestureDetector(
                onTap: () => onIndexSelected(index),
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    index == selectedIndex ? color.border : color.onCard,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
