import 'user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> signInWithGoogle();
}
