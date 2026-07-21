import 'package:shared_preferences/shared_preferences.dart';

/// Raw key/value persistence. Repository maps these primitives to/from
/// domain entities — this class knows nothing about [AppLanguage] etc.
class SettingsLocalDataSource {
  const SettingsLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  static const _themeModeKey = 'settings_theme_mode';
  static const _pushEnabledKey = 'settings_push_notifications_enabled';
  static const _emailEnabledKey = 'settings_email_notifications_enabled';

  String? getThemeModeValue() => _prefs.getString(_themeModeKey);
  Future<void> setThemeModeValue(String value) =>
      _prefs.setString(_themeModeKey, value);

  bool getPushEnabled() => _prefs.getBool(_pushEnabledKey) ?? false;
  Future<void> setPushEnabled(bool value) =>
      _prefs.setBool(_pushEnabledKey, value);

  bool getEmailEnabled() => _prefs.getBool(_emailEnabledKey) ?? false;
  Future<void> setEmailEnabled(bool value) =>
      _prefs.setBool(_emailEnabledKey, value);
}
