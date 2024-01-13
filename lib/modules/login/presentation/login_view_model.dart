import 'package:flutter/foundation.dart';

import '../../../core/presentation/base_view_model.dart';
import '../data/login_repository_impl.dart';
import '../domain/sign_in_with_google_usecase.dart';

/// View model for handling the login functionality.
class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._signInWithGoogleUsecase);

  final SignInWithGoogleUsecase _signInWithGoogleUsecase;

  /// Notifier for indicating the loading state.
  final _loading = ValueNotifier<bool>(false);

  /// Returns a [ValueListenable] indicating the loading state.
  ValueListenable<bool> get loading => _loading;

  /// Initiates the Google Sign-In process.
  ///
  /// If [onSuccess] is provided, it will be called upon successful sign-in.
  Future<void> signInWithGoogle([VoidCallback? onSuccess]) async {
    try {
      _loading.value = true;
      await _signInWithGoogleUsecase();
      onSuccess?.call();
    } finally {
      _loading.value = false;
    }
  }
}

LoginViewModel getLoginViewModel() => LoginViewModel(
      SignInWithGoogleUsecase(LoginRepositoryImpl()),
    );