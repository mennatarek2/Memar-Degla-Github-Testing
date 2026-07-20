import 'package:easy_localization/easy_localization.dart';
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
      NetworkFailure() => FailureUiModel(
        icon: Icons.wifi_off_rounded,
        title: 'errors.no_internet_connection'.tr(),
        message: 'errors.check_connection'.tr(),
        canRetry: true,
      ),
      TimeoutFailure() => FailureUiModel(
        icon: Icons.hourglass_bottom_rounded,
        title: 'errors.taking_longer_than_usual'.tr(),
        message: 'errors.request_timed_out'.tr(),
        canRetry: true,
      ),
      ServerFailure() => FailureUiModel(
        icon: Icons.dns_rounded,
        title: 'errors.something_went_wrong'.tr(),
        message: message ?? 'errors.working_on_it'.tr(),
        canRetry: true,
      ),
      UnauthorizedFailure() => FailureUiModel(
        icon: Icons.lock_outline_rounded,
        title: 'errors.session_expired'.tr(),
        message: 'errors.please_login_again'.tr(),
        // Handled as a side effect (force logout) by the caller —
        // this copy only matters if it's ever shown as a fallback.
        canRetry: false,
      ),
      ForbiddenFailure() => FailureUiModel(
        icon: Icons.block_rounded,
        title: 'errors.no_access'.tr(),
        message: 'errors.no_permission'.tr(),
        canRetry: false,
      ),
      NotFoundFailure() => FailureUiModel(
        icon: Icons.search_off_rounded,
        title: 'errors.not_found'.tr(),
        message: 'errors.could_not_find'.tr(),
        canRetry: false,
      ),
      ConflictFailure(:final message) => FailureUiModel(
        icon: Icons.error_outline_rounded,
        title: 'errors.unable_to_continue'.tr(),
        // e.g. "Sorry, this email is already used." — from the backend.
        message: message ?? 'errors.unable_to_continue'.tr(),
        canRetry: false,
      ),
      ValidationFailure(:final message) => FailureUiModel(
        icon: Icons.warning_amber_rounded,
        title: 'errors.check_input'.tr(),
        message: message ?? 'errors.some_fields_need_attention'.tr(),
        canRetry: false,
      ),
      RateLimitFailure() => FailureUiModel(
        icon: Icons.timer_outlined,
        title: 'errors.slow_down'.tr(),
        message: 'errors.too_many_attempts'.tr(),
        canRetry: false,
      ),
      CacheFailure() => FailureUiModel(
        icon: Icons.storage_rounded,
        title: 'errors.could_not_load_saved_data'.tr(),
        message: 'common.retry'.tr(),
        canRetry: true,
      ),
      ParsingFailure() => FailureUiModel(
        icon: Icons.error_outline_rounded,
        title: 'errors.something_went_wrong_short'.tr(),
        message: 'errors.try_again_later'.tr(),
        canRetry: true,
      ),
      UnexpectedFailure() => FailureUiModel(
        icon: Icons.error_outline_rounded,
        title: 'errors.unexpected_error'.tr(),
        message: 'errors.something_went_wrong_short'.tr(),
        canRetry: true,
      ),
    };
  }
}
