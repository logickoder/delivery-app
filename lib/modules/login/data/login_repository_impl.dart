import '../domain/login_repository.dart';
import '../domain/user_entity.dart';
import 'login_remote_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final _datasource = LoginRemoteDatasource();

  @override
  Future<UserEntity> signInWithGoogle() async {
    final model = await _datasource.signInWithGoogle();
    return UserEntity(id: model.id);
  }
}
