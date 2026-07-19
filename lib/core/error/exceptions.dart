/// All exceptions the data layer is allowed to throw.
///
/// Rule: nothing else (DioException, SocketException, FormatException,
/// a null-check crash mid-parse, ...) should ever leave the data layer.
/// Every remote/local data source wraps its work in try/catch and
/// rethrows one of these instead. See [DioExceptionMapper] for the
/// network-specific mapping.
sealed class AppException implements Exception {
  /// Optional message coming straight from the backend, e.g.
  /// "Sorry, this email is already used." Shown to the user as-is
  /// when present, since the backend usually phrases these for humans.
  final String? message;

  const AppException({this.message});

  @override
  String toString() => '$runtimeType(message: $message)';
}

/// No route to the internet at all (SocketException, connection error).
class NetworkException extends AppException {
  const NetworkException({super.message});
}

/// Client or server timed out before responding.
class TimeoutException extends AppException {
  const TimeoutException({super.message});
}

/// Generic 5xx — something broke on the server, not the client's fault.
class ServerException extends AppException {
  final int? statusCode;
  const ServerException({this.statusCode, super.message});
}

/// 401 — token missing/expired. Presentation layer should react to this
/// by logging the user out, not by showing a generic error widget.
class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message});
}

/// 403 — authenticated, but not allowed. Retrying will not help.
class ForbiddenException extends AppException {
  const ForbiddenException({super.message});
}

/// 404 — resource doesn't exist.
class NotFoundException extends AppException {
  const NotFoundException({super.message});
}

/// 409 — conflict with current state, e.g. "email already used",
/// "username taken". [message] almost always comes straight from the
/// backend and is what gets shown to the user.
class ConflictException extends AppException {
  const ConflictException({super.message});
}

/// 400 / 422 — request was rejected due to invalid input.
/// [fieldErrors] lets you highlight specific form fields if the API
/// returns them (e.g. {"email": ["is invalid"]}).
class ValidationException extends AppException {
  final Map<String, List<String>>? fieldErrors;
  const ValidationException({this.fieldErrors, super.message});
}

/// 429 — client is being rate limited. Retrying immediately will make
/// it worse; the UI should disable retry for a cooldown period.
class RateLimitException extends AppException {
  final Duration? retryAfter;
  const RateLimitException({this.retryAfter, super.message});
}

/// Local cache/database read or write failed.
class CacheException extends AppException {
  const CacheException({super.message});
}

/// JSON/DTO parsing failed — usually a null or missing field from the
/// backend that didn't match what the model expected. Catching this
/// here is what stops a null-from-backend from crashing the UI.
class ParsingException extends AppException {
  const ParsingException({super.message});
}

/// Anything that doesn't fit the above. Should be rare — if you find
/// yourself throwing this a lot, it usually means a new, more specific
/// exception type is worth adding instead.
class UnexpectedException extends AppException {
  const UnexpectedException({super.message});
}
