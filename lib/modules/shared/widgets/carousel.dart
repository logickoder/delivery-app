import 'package:flutter/material.dart';

import '../../../core/app/theme.dart';
import 'expandable_page_view.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.count,
    required this.itemBuilder,
    required this.inactiveIndicator,
    this.indicatorGap = 24,
    this.indicatorSpacing = 10,
  });

  final int count;
  final IndexedWidgetBuilder itemBuilder;
  final Color inactiveIndicator;
  final double indicatorGap;
  final double indicatorSpacing;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExpandablePageView(
          count: widget.count,
          itemBuilder: widget.itemBuilder,
          onPageChanged: (index) {
            setState(() => active = index);
          },
        ),
        SizedBox(height: widget.indicatorGap),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(widget.count, (index) {
            return Container(
              margin: const EdgeInsets.all(3),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: active == index
                    ? color.secondary
                    : widget.inactiveIndicator,
                shape: BoxShape.circle,
              ),
            );
          }),
        )
      ],
    );
  }
}
