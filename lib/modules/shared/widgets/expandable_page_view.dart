import 'package:flutter/material.dart';

class ExpandablePageView extends StatefulWidget {
  final int count;
  final IndexedWidgetBuilder itemBuilder;
  final Function(int)? onPageChanged;

  const ExpandablePageView({
    super.key,
    required this.count,
    required this.itemBuilder,
    this.onPageChanged,
  });

  @override
  State<ExpandablePageView> createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late List<double> _heights;

  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    super.initState();
    _heights = List.filled(widget.count, 0);
    _pageController = PageController()
      ..addListener(() {
        final newPage = _pageController.page?.round();
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
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: true,
        itemBuilder: (context, index) => OverflowBox(
          //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    super.key,
    required this.child,
    required this.onSizeChange,
  });

  @override
  State<SizeReportingWidget> createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    final size = context.size;
    if (size == null) {
      return;
    }

    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }
}
