import 'package:flutter/material.dart';

import 'base_view_model.dart';

/// Provides a [BaseViewModel] to the [child] widget and its descendants.
///
/// This [InheritedWidget] is designed to hold and provide a [BaseViewModel] of type [T]
/// to its [child] widget and all its descendants in the widget tree.
///
/// Usage:
/// ```dart
/// ViewModelProvider<MyViewModel>(
///   MyViewModel(), // Your instance of the ViewModel
///   child: YourWidget(),
/// );
/// ```
class ViewModelProvider<T extends BaseViewModel> extends InheritedWidget {
  /// The associated [BaseViewModel] instance.
  final T _viewModel;

  /// Creates a [ViewModelProvider] with the provided [viewModel].
  const ViewModelProvider(
    this._viewModel, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  /// Gets the closest associated [BaseViewModel] of type [T] from the widget tree.
  ///
  /// Throws an [Exception] if the [ViewModelProvider] is not found in the widget tree.
  static T of<T extends BaseViewModel>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();
    if (provider == null) {
      throw Exception(
        'ViewModelProvider for ${T.toString()} not found',
      );
    }
    return provider._viewModel;
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => false;
}
