import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';

/// Persists and reads the user's settings choices.
///
/// Presentation only ever talks to this interface — the concrete
/// implementation (SharedPreferences today, could be anything later)
/// lives in the data layer.
abstract class SettingsRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode mode);

  Future<bool> getPushNotificationsEnabled();
  Future<void> setPushNotificationsEnabled(bool enabled);

  Future<bool> getEmailNotificationsEnabled();
  Future<void> setEmailNotificationsEnabled(bool enabled);
}
