import 'exceptions.dart';
import 'failures.dart';

/// Bridges the data layer to the domain layer. Use inside every
/// repository implementation's catch block:
///
/// ```dart
/// class UserRepositoryImpl implements UserRepository {
///   @override
///   Future<Either<Failure, User>> login(String email, String password) async {
///     try {
///       final dto = await remoteDataSource.login(email, password);
///       return Right(dto.toEntity());
///     } on AppException catch (e) {
///       return Left(ExceptionToFailureMapper.map(e));
///     }
///   }
/// }
/// ```
///
/// This is a pure 1:1 structural mapping on purpose — the exception
/// already carries everything the failure needs. Keep it that way;
/// if a repository needs different behavior per failure, that
/// decision belongs in the Bloc/Cubit or the UI mapper, not here.
class ExceptionToFailureMapper {
  const ExceptionToFailureMapper._();

  static Failure map(AppException exception) {
    return switch (exception) {
      NetworkException() => NetworkFailure(message: exception.message),
      TimeoutException() => TimeoutFailure(message: exception.message),
      ServerException(:final statusCode) => ServerFailure(
          statusCode: statusCode,
          message: exception.message,
        ),
      UnauthorizedException() => UnauthorizedFailure(message: exception.message),
      ForbiddenException() => ForbiddenFailure(message: exception.message),
      NotFoundException() => NotFoundFailure(message: exception.message),
      ConflictException() => ConflictFailure(message: exception.message),
      ValidationException(:final fieldErrors) => ValidationFailure(
          fieldErrors: fieldErrors,
          message: exception.message,
        ),
      RateLimitException(:final retryAfter) => RateLimitFailure(
          retryAfter: retryAfter,
          message: exception.message,
        ),
      CacheException() => CacheFailure(message: exception.message),
      ParsingException() => ParsingFailure(message: exception.message),
      UnexpectedException() => UnexpectedFailure(message: exception.message),
    };
  }
}
