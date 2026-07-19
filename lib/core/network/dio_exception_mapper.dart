// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../error/exceptions.dart';

// /// Call this from every remote data source's catch block:
// ///
// /// ```dart
// /// try {
// ///   final response = await dio.post('/login', data: body);
// ///   return LoginResponseDto.fromJson(response.data);
// /// } on DioException catch (e) {
// ///   throw DioExceptionMapper.map(e);
// /// } on TypeError catch (_) {
// ///   // a required field came back null/wrong-shaped from the backend
// ///   throw const ParsingException();
// /// }
// /// ```
// ///
// /// This is the single place status codes get interpreted — see the
// /// status-code table this mirrors:
// /// 400/422 -> ValidationException, 401 -> UnauthorizedException,
// /// 403 -> ForbiddenException, 404 -> NotFoundException,
// /// 408 -> TimeoutException, 409 -> ConflictException,
// /// 429 -> RateLimitException, 5xx -> ServerException.
// class DioExceptionMapper {
//   const DioExceptionMapper._();

//   static AppException map(DioException error) {
//     if (error.type == DioExceptionType.connectionError ||
//         error.error is SocketException) {
//       return const NetworkException();
//     }

//     if (error.type == DioExceptionType.connectionTimeout ||
//         error.type == DioExceptionType.sendTimeout ||
//         error.type == DioExceptionType.receiveTimeout) {
//       return const TimeoutException();
//     }

//     if (error.type == DioExceptionType.cancel) {
//       return const UnexpectedException(message: 'Request was cancelled');
//     }

//     final statusCode = error.response?.statusCode;
//     final serverMessage = _extractMessage(error.response?.data);

//     switch (statusCode) {
//       case 400:
//       case 422:
//         return ValidationException(
//           message: serverMessage,
//           fieldErrors: _extractFieldErrors(error.response?.data),
//         );
//       case 401:
//         return UnauthorizedException(message: serverMessage);
//       case 403:
//         return ForbiddenException(message: serverMessage);
//       case 404:
//         return NotFoundException(message: serverMessage);
//       case 408:
//         return const TimeoutException();
//       case 409:
//         return ConflictException(message: serverMessage);
//       case 429:
//         return RateLimitException(message: serverMessage);
//     }

//     if (statusCode != null && statusCode >= 500) {
//       return ServerException(statusCode: statusCode, message: serverMessage);
//     }

//     return UnexpectedException(message: serverMessage);
//   }

//   /// Adjust these keys to match your backend's actual error envelope.
//   /// Common shapes: {"message": "..."} or {"error": {"message": "..."}}.
//   static String? _extractMessage(dynamic data) {
//     if (data is Map<String, dynamic>) {
//       final direct = data['message'];
//       if (direct is String) return direct;

//       final nested = data['error'];
//       if (nested is Map<String, dynamic> && nested['message'] is String) {
//         return nested['message'] as String;
//       }
//     }
//     return null;
//   }

//   /// Adjust to match your backend's validation error shape, e.g.
//   /// {"errors": {"email": ["is already used"]}}.
//   static Map<String, List<String>>? _extractFieldErrors(dynamic data) {
//     if (data is Map<String, dynamic> && data['errors'] is Map) {
//       final raw = data['errors'] as Map;
//       return raw.map(
//         (key, value) => MapEntry(
//           key.toString(),
//           (value as List).map((e) => e.toString()).toList(),
//         ),
//       );
//     }
//     return null;
//   }
// }
//TODO uncomment the file when adding the dio package for http handling and requests
