import 'package:flutter/material.dart';

import 'size_reporting_widget.dart';

class ExpandablePageView extends StatefulWidget {
  final PageController controller;
  final int count;
  final IndexedWidgetBuilder itemBuilder;
  final Function(int)? onPageChanged;

  const ExpandablePageView({
    super.key,
    required this.controller,
    required this.count,
    required this.itemBuilder,
    this.onPageChanged,
  });

  @override
  State<ExpandablePageView> createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView>
    with TickerProviderStateMixin {
  int _currentPage = 0;

  late final List<double> _heights = List.filled(widget.count, 0);

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    widget.controller.addListener(() {
      final newPage = widget.controller.page?.round();
      if (newPage == null) {
        return;
      }
      if (_currentPage != newPage) {
        setState(() {
          _currentPage = newPage;
          widget.onPageChanged?.call(newPage);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView.builder(
        controller: widget.controller,
        pageSnapping: true,
        itemBuilder: (context, index) => OverflowBox(
          // needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
          minHeight: 0,
          maxHeight: double.infinity,
          alignment: Alignment.topCenter,
          child: SizeReportingWidget(
            onSizeChange: (size) => setState(
              () => _heights[index] = size.height,
            ),
            child: widget.itemBuilder(context, index),
          ),
        ),
        itemCount: widget.count,
      ),
    );
  }
}
