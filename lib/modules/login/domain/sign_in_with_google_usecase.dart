import 'dart:ffi';

import '../../../core/domain/base_usecase.dart';
import 'login_repository.dart';
import 'user_entity.dart';

/// A use case for signing in with Google authentication.
class SignInWithGoogleUsecase implements BaseUseCase<UserEntity, Void> {
  const SignInWithGoogleUsecase(this._repository);

  final LoginRepository _repository;

  @override
  Future<UserEntity> call([Void? value]) async {
    final model = await _repository.signInWithGoogle();
    return UserEntity(id: model.id);
  }
}
