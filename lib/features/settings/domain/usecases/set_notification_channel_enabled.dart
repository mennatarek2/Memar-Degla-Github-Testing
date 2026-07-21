import 'package:memar_degla/features/settings/domain/entities/notification_channel.dart';
import 'package:memar_degla/features/settings/domain/repositories/notification_permission_service.dart';
import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

/// Result of trying to flip a notification channel on/off.
///
/// [enabled] reflects what actually ended up persisted — turning push ON
/// can fail (permission denied), so the cubit needs more than a bare
/// bool to tell the UI "the OS said no" vs "it just didn't change".
class SetNotificationChannelResult {
  const SetNotificationChannelResult({
    required this.enabled,
    required this.permissionDenied,
  });

  final bool enabled;
  final bool permissionDenied;
}

class SetNotificationChannelEnabled {
  const SetNotificationChannelEnabled(this._repository, this._permissionService);

  final SettingsRepository _repository;
  final NotificationPermissionService _permissionService;

  Future<SetNotificationChannelResult> call({
    required NotificationChannel channel,
    required bool enabled,
  }) async {
    // Turning a channel OFF never needs the OS permission dialog.
    if (!enabled) {
      await _persist(channel, false);
      return const SetNotificationChannelResult(
        enabled: false,
        permissionDenied: false,
      );
    }

    // Turning email ON doesn't touch OS-level notification permission.
    if (channel == NotificationChannel.email) {
      await _persist(channel, true);
      return const SetNotificationChannelResult(
        enabled: true,
        permissionDenied: false,
      );
    }

    // Turning push ON: ask the OS first, only persist "enabled" if granted.
    final alreadyGranted = await _permissionService.isGranted();
    final granted = alreadyGranted || await _permissionService.request();

    await _persist(channel, granted);
    return SetNotificationChannelResult(
      enabled: granted,
      permissionDenied: !granted,
    );
  }

  Future<void> _persist(NotificationChannel channel, bool value) {
    return channel == NotificationChannel.push
        ? _repository.setPushNotificationsEnabled(value)
        : _repository.setEmailNotificationsEnabled(value);
  }
}
