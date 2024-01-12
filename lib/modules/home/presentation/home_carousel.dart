import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/app/theme.dart';
import '../../shared/widgets/carousel.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 301,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final padding = constraints.maxWidth * .06;
          final spacing = padding / 2;
          const count = 6;

          return Carousel(
            count: count,
            indicatorGap: 30,
            viewportFraction: .68,
            useExpandablePageView: false,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? padding : 0,
                  right: index == count - 1 ? padding : spacing,
                ),
                child: _CarouselItem(
                    'https://picsum.photos/${300 + index}', index == active),
              );
            },
            inactiveIndicator: AppColor.of(context).card,
            onPageChanged: (index) => setState(() => active = index),
          );
        },
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem(this._image, this._active);

  final String _image;
  final bool _active;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: constraints.maxHeight * .07,
          horizontal: constraints.maxWidth * .11,
        ),
        decoration: BoxDecoration(
          color: AppColor.of(context).card,
          borderRadius: BorderRadius.circular(32),
        ),
        child: CachedNetworkImage(
          imageUrl: _image,
          placeholder: (_, __) => const Icon(
            Icons.shopping_basket_outlined,
          ),
          errorWidget: (_, __, ___) => const Icon(
            Icons.shopping_basket_outlined,
          ),
          fit: BoxFit.cover,
          color: _active ? null : AppColor.of(context).card.withAlpha(204),
          colorBlendMode: _active ? null : BlendMode.srcATop,
        ),
      );
    });
  }
}
