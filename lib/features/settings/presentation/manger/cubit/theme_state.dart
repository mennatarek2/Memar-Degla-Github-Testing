import 'package:equatable/equatable.dart';
import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';

class SettingsThemeState extends Equatable {
  const SettingsThemeState({required this.mode, this.isLoading = false});

  const SettingsThemeState.initial()
    : mode = AppThemeMode.dark,
      isLoading = true;

  final AppThemeMode mode;
  final bool isLoading;

  SettingsThemeState copyWith({AppThemeMode? mode, bool? isLoading}) {
    return SettingsThemeState(
      mode: mode ?? this.mode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [mode, isLoading];
}
