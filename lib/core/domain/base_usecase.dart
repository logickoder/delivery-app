/// A generic abstract class representing a use case in the application.
///
/// [Type] represents the type of result that the use case will produce.
/// [Request] represents the type of input parameters that the use case can accept.
abstract class BaseUseCase<Type, Request> {
  /// Executes the use case with optional input parameters.
  ///
  /// Implementations of this method should contain the specific business logic
  /// or operations associated with the use case. The method returns a Future
  /// representing the asynchronous result of the use case execution.
  ///
  /// Example:
  /// ```dart
  /// MyUseCase extends BaseUseCase<int, String> {
  ///   @override
  ///   Future<int> call([String params]) async {
  ///     // Business logic implementation
  ///     return 42; // Result of the use case
  ///   }
  /// }
  /// ```
  Future<Type> call([Request params]);
}
