import 'package:flutter/foundation.dart';

import '../data/login_repository_impl.dart';
import '../domain/sign_in_with_google_usecase.dart';

class LoginViewModel {
  LoginViewModel(this._signInWithGoogleUsecase);

  final SignInWithGoogleUsecase _signInWithGoogleUsecase;

  final _loading = ValueNotifier<bool>(false);

  ValueListenable<bool> get loading => _loading;

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
