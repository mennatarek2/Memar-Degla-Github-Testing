import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

class SelectThemeMode {
  const SelectThemeMode(this._repository);

  final SettingsRepository _repository;

  Future<void> call(AppThemeMode mode) => _repository.setThemeMode(mode);
}
