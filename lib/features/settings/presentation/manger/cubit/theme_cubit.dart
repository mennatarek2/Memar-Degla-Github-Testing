import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/usecases/get_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/usecases/select_theme_mode.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_state.dart';

class ThemeCubit extends Cubit<SettingsThemeState> {
  ThemeCubit(this._getThemeMode, this._selectThemeMode)
    : super(const SettingsThemeState.initial()) {
    _load();
  }

  final GetThemeMode _getThemeMode;
  final SelectThemeMode _selectThemeMode;

  Future<void> _load() async {
    final mode = await _getThemeMode();
    emit(state.copyWith(mode: mode, isLoading: false));
  }

  Future<void> selectMode(AppThemeMode mode) async {
    if (mode == state.mode) return;
    emit(state.copyWith(mode: mode));
    await _selectThemeMode(mode);
  }
}
