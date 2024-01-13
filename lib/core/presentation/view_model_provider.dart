import 'package:flutter/material.dart';

import 'base_view_model.dart';

/// Provides a [BaseViewModel] to the [child] widget and its descendants
class ViewModelProvider<T extends BaseViewModel> extends InheritedWidget {
  final T _viewModel;

  const ViewModelProvider(
    this._viewModel, {
    super.key,
    required super.child,
  });

  /// Gets the closest associated [BaseViewModel] of type [T] from the widget tree
  static T of<T extends BaseViewModel>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();
    if (provider == null) {
      throw Exception(
        'ViewModelProvider for ${ViewModelProvider<T>} not found',
      );
    }
    return provider._viewModel;
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => false;
}
