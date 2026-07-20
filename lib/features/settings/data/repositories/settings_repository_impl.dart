import 'package:memar_degla/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:memar_degla/features/settings/domain/entities/app_language.dart';
import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._localDataSource);

  final SettingsLocalDataSource _localDataSource;

  @override
  Future<AppThemeMode> getThemeMode() async {
    final value = _localDataSource.getThemeModeValue();
    return AppThemeModeCode.fromStorageValue(value);
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) {
    return _localDataSource.setThemeModeValue(mode.storageValue);
  }

  @override
  Future<bool> getPushNotificationsEnabled() async {
    return _localDataSource.getPushEnabled();
  }

  @override
  Future<void> setPushNotificationsEnabled(bool enabled) {
    return _localDataSource.setPushEnabled(enabled);
  }

  @override
  Future<bool> getEmailNotificationsEnabled() async {
    return _localDataSource.getEmailEnabled();
  }

  @override
  Future<void> setEmailNotificationsEnabled(bool enabled) {
    return _localDataSource.setEmailEnabled(enabled);
  }
}
