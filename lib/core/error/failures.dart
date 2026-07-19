/// The closed set of things that can go wrong, as far as the domain and
/// presentation layers are concerned. Repositories return
/// `Either<Failure, T>` — never throw, never leak an [AppException]
/// upward. Pure Dart, no Flutter/Dio imports, safe to unit test in
/// isolation.
sealed class Failure {
  /// Optional backend-provided message (e.g. "email already used").
  /// When present, the UI mapper prefers this over its own generic copy.
  final String? message;

  const Failure({this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message});
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({this.statusCode, super.message});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message});
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message});
}

class ConflictFailure extends Failure {
  const ConflictFailure({super.message});
}

class ValidationFailure extends Failure {
  final Map<String, List<String>>? fieldErrors;
  const ValidationFailure({this.fieldErrors, super.message});
}

class RateLimitFailure extends Failure {
  final Duration? retryAfter;
  const RateLimitFailure({this.retryAfter, super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

class ParsingFailure extends Failure {
  const ParsingFailure({super.message});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message});
}
