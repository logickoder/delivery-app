import 'package:flutter/material.dart';

import '../../../core/app/theme.dart';
import 'expandable_page_view.dart';

class Carousel extends StatefulWidget {
  final int count;
  final IndexedWidgetBuilder itemBuilder;
  final Color inactiveIndicator;
  final double indicatorGap;
  final double indicatorSpacing;
  final double viewportFraction;
  final bool useExpandablePageView;
  final ValueChanged<int>? onPageChanged;

  const Carousel({
    super.key,
    required this.count,
    this.viewportFraction = 1,
    required this.itemBuilder,
    required this.inactiveIndicator,
    this.indicatorGap = 24,
    this.indicatorSpacing = 10,
    this.useExpandablePageView = true,
    this.onPageChanged,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final _controller = PageController(
    viewportFraction: widget.viewportFraction,
  );
  int active = 0;

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.useExpandablePageView
            ? ExpandablePageView(
                controller: _controller,
                count: widget.count,
                itemBuilder: widget.itemBuilder,
                onPageChanged: _onPageChanged,
              )
            : Expanded(
                child: PageView.builder(
                  controller: _controller,
                  pageSnapping: true,
                  padEnds: false,
                  itemBuilder: widget.itemBuilder,
                  itemCount: widget.count,
                  onPageChanged: _onPageChanged,
                ),
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

  void _onPageChanged(int index) {
    setState(() => active = index);
    widget.onPageChanged?.call(index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
