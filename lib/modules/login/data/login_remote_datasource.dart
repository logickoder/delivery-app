import 'user_model.dart';

/// A data source for remote login functionality.
class LoginRemoteDatasource {
  /// Signs in a user using Google authentication.
  ///
  /// Returns a [UserModel] after a simulated delay of 2 seconds.
  Future<UserModel> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    return const UserModel(id: '1');
  }
}
