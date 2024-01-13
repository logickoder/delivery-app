import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/app/theme.dart';
import '../../../core/presentation/view_model_provider.dart';
import '../../shared/widgets/carousel.dart';
import 'home_view_model.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModelProvider.of<HomeViewModel>(context);

    return AspectRatio(
      aspectRatio: 375 / 301,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final padding = constraints.maxWidth * .06;
          final spacing = padding / 2;

          return ListenableBuilder(
            listenable: viewModel.state,
            builder: (_, __) {
              if (viewModel.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final images = viewModel.images.value;

              return Carousel(
                count: images.length,
                indicatorGap: 30,
                viewportFraction: .68,
                useExpandablePageView: false,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? padding : 0,
                      right: index == images.length - 1 ? padding : spacing,
                    ),
                    child: _CarouselItem(images[index], index == active),
                  );
                },
                inactiveIndicator: AppColor.of(context).card,
                onPageChanged: (index) => setState(() => active = index),
              );
            },
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
          fit: BoxFit.contain,
          color: _active ? null : AppColor.of(context).card.withAlpha(204),
          colorBlendMode: _active ? null : BlendMode.srcATop,
        ),
      );
    });
  }
}
