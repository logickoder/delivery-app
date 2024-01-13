import 'package:delivery_app/modules/login/data/user_model.dart';
import 'package:delivery_app/modules/login/domain/login_repository.dart';
import 'package:delivery_app/modules/login/domain/sign_in_with_google_usecase.dart';
import 'package:delivery_app/modules/login/domain/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInWithGoogleUsecase', () {
    late SignInWithGoogleUsecase usecase;
    late MockLoginRepository mockRepository;

    setUp(() {
      mockRepository = MockLoginRepository();
      usecase = SignInWithGoogleUsecase(mockRepository);
    });

    test('should sign in with Google and return a UserEntity', () async {
      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const UserEntity(id: '123')));
    });

    // Add more tests as needed.
  });
}

/// A mock repository for testing purposes.
class MockLoginRepository extends LoginRepository {
  @override
  Future<UserModel> signInWithGoogle() async {
    return const UserModel(id: '123');
  }
}
