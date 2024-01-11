import 'package:flutter/material.dart';

/// A widget that switches between a [child] and a [RefreshProgressIndicator]
class LoadingWidget extends StatefulWidget {
  /// The value that determines whether to show the loading indicator
  final bool loading;

  /// The widget to show when [loading] is false
  final Widget child;

  const LoadingWidget({
    super.key,
    required this.loading,
    required this.child,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  final _key = GlobalKey();

  late final AnimationController _controller;
  double _height = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Durations.long4,
    );

    /// This is a workaround to get the height of the child widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
      if (renderBox.hasSize && _height != renderBox.size.height) {
        setState(() {
          _height = renderBox.size.height;
        });
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoadingWidget oldWidget) {
    if (widget.loading) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: _key,
      builder: (_, constraints) {
        final widthAnimation = Tween<double>(
          begin: constraints.maxWidth,
          end: _height,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );

        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            if (_controller.isAnimating || !widget.loading) {
              return UnconstrainedBox(
                child: SizedBox(
                  height: _controller.isAnimating ? _height : null,
                  width: widthAnimation.value,
                  child: widget.child,
                ),
              );
            }
            return Center(
              child: SizedBox(
                width: _height,
                height: _height,
                child: const RefreshProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
