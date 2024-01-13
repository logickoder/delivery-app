import '../domain/login_repository.dart';
import 'login_remote_datasource.dart';
import 'user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final _datasource = LoginRemoteDatasource();

  @override
  Future<UserModel> signInWithGoogle() => _datasource.signInWithGoogle();
}
