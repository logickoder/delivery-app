import '../data/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> signInWithGoogle();
}
