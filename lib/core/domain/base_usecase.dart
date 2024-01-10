abstract class BaseUseCase<Type, Request> {
  Future<Type> call([Request params]);
}
