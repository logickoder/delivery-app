import 'package:delivery_app/modules/login/data/login_remote_datasource.dart';
import 'package:delivery_app/modules/login/data/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginRemoteDatasource', () {
    test('signInWithGoogle should return a UserModel with id "1"', () async {
      final datasource = LoginRemoteDatasource();
      final user = await datasource.signInWithGoogle();

      expect(user, const UserModel(id: '1'));
    });
  });
}
