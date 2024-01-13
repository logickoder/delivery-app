import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20),
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: FractionallySizedBox(
          widthFactor: AppDimen.widthFactor,
          child: LayoutBuilder(builder: (_, constraints) {
            final avatarWidth = constraints.maxWidth * .15;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(avatarWidth),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.gravatar.com/avatar/6d94860616dbab71d6d2d2485c698bb3?s=400',
                    placeholder: (_, __) => const Icon(Icons.person),
                    errorWidget: (_, __, ___) => const Icon(Icons.person),
                    width: avatarWidth,
                    height: avatarWidth,
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.of(context).card,
                  child: IconButton(
                    icon: SvgPicture.asset(AppAsset.notificationIcon),
                    onPressed: null,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
