import 'package:flutter/material.dart';
import '../error/failures.dart';

/// Everything a widget needs to render a failure — nothing technical,
/// nothing the user can't act on.
class FailureUiModel {
  final IconData icon;
  final String title;
  final String message;
  final bool canRetry;

  const FailureUiModel({
    required this.icon,
    required this.title,
    required this.message,
    required this.canRetry,
  });
}

/// The single place that decides what copy a user sees for each
/// [Failure]. Localize the generic strings here (e.g. via easy_localization)
/// when you're ready — everything else in the pipeline stays unchanged.
///
/// Rule of thumb: if [Failure.message] is set, it came from the backend
/// and is usually already phrased for a human ("Sorry, this email is
/// already used") — prefer it. Otherwise fall back to a generic,
/// client-owned message so a bare 500 never reaches the user as-is.
extension FailureUiMapper on Failure {
  FailureUiModel toUiModel() {
    return switch (this) {
      NetworkFailure() => const FailureUiModel(
          icon: Icons.wifi_off_rounded,
          title: 'No internet connection',
          message: 'Check your connection and try again.',
          canRetry: true,
        ),
      TimeoutFailure() => const FailureUiModel(
          icon: Icons.hourglass_bottom_rounded,
          title: 'Taking longer than usual',
          message: 'The request timed out. Please try again.',
          canRetry: true,
        ),
      ServerFailure() => FailureUiModel(
          icon: Icons.dns_rounded,
          title: 'Something went wrong on our end',
          message: message ?? "We're working on it — please try again shortly.",
          canRetry: true,
        ),
      UnauthorizedFailure() => const FailureUiModel(
          icon: Icons.lock_outline_rounded,
          title: 'Session expired',
          message: 'Please log in again to continue.',
          // Handled as a side effect (force logout) by the caller —
          // this copy only matters if it's ever shown as a fallback.
          canRetry: false,
        ),
      ForbiddenFailure() => const FailureUiModel(
          icon: Icons.block_rounded,
          title: "You don't have access",
          message: "You don't have permission to do this.",
          canRetry: false,
        ),
      NotFoundFailure() => const FailureUiModel(
          icon: Icons.search_off_rounded,
          title: 'Not found',
          message: "This couldn't be found. It may have been removed.",
          canRetry: false,
        ),
      ConflictFailure(:final message) => FailureUiModel(
          icon: Icons.error_outline_rounded,
          title: 'Unable to continue',
          // e.g. "Sorry, this email is already used." — from the backend.
          message: message ?? 'This action conflicts with existing data.',
          canRetry: false,
        ),
      ValidationFailure(:final message) => FailureUiModel(
          icon: Icons.warning_amber_rounded,
          title: 'Check your input',
          message: message ?? 'Some fields need your attention.',
          canRetry: false,
        ),
      RateLimitFailure() => const FailureUiModel(
          icon: Icons.timer_outlined,
          title: 'Slow down a little',
          message: 'Too many attempts — please wait a moment and try again.',
          canRetry: false,
        ),
      CacheFailure() => const FailureUiModel(
          icon: Icons.storage_rounded,
          title: "Couldn't load saved data",
          message: 'Please try again.',
          canRetry: true,
        ),
      ParsingFailure() => const FailureUiModel(
          icon: Icons.error_outline_rounded,
          title: 'Something went wrong',
          message: 'Please try again in a moment.',
          canRetry: true,
        ),
      UnexpectedFailure() => const FailureUiModel(
          icon: Icons.error_outline_rounded,
          title: 'Unexpected error',
          message: 'Something went wrong. Please try again.',
          canRetry: true,
        ),
    };
  }
}
