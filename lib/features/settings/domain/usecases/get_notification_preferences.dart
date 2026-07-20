import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

class NotificationPreferences {
  const NotificationPreferences({
    required this.pushEnabled,
    required this.emailEnabled,
  });

  final bool pushEnabled;
  final bool emailEnabled;
}

class GetNotificationPreferences {
  const GetNotificationPreferences(this._repository);

  final SettingsRepository _repository;

  Future<NotificationPreferences> call() async {
    final push = await _repository.getPushNotificationsEnabled();
    final email = await _repository.getEmailNotificationsEnabled();
    return NotificationPreferences(pushEnabled: push, emailEnabled: email);
  }
}
