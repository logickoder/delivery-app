import 'user_model.dart';

class LoginRemoteDatasource {
  Future<UserModel> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    return const UserModel(id: '1');
  }
}
