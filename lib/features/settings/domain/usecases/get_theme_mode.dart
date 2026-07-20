import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

class GetThemeMode {
  const GetThemeMode(this._repository);

  final SettingsRepository _repository;

  Future<AppThemeMode> call() => _repository.getThemeMode();
}
