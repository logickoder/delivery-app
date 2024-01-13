import 'dart:ffi';

import '../../../core/domain/base_usecase.dart';
import 'login_repository.dart';
import 'user_entity.dart';

class SignInWithGoogleUsecase implements BaseUseCase<UserEntity, Void> {
  const SignInWithGoogleUsecase(this._repository);

  final LoginRepository _repository;

  @override
  Future<UserEntity> call([Void? value]) {
    return _repository.signInWithGoogle();
  }
}
