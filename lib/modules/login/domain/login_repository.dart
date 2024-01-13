import '../data/user_model.dart';

/// Abstract class representing a login repository for authentication.
abstract class LoginRepository {
  /// Signs in the user using Google authentication.
  ///
  /// Returns a [UserModel] representing the authenticated user.
  Future<UserModel> signInWithGoogle();
}
