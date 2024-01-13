import '../domain/login_repository.dart';
import 'login_remote_datasource.dart';
import 'user_model.dart';

/// A concrete implementation of the [LoginRepository] interface.
class LoginRepositoryImpl implements LoginRepository {
  /// The remote data source for handling login operations.
  final _datasource = LoginRemoteDatasource();

  @override
  Future<UserModel> signInWithGoogle() => _datasource.signInWithGoogle();
}
