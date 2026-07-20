/// App-level theme choice.
///
/// Deliberately not `package:flutter/material.dart`'s `ThemeMode` — domain
/// stays framework-free. Presentation maps this to Flutter's `ThemeMode`.
enum AppThemeMode { light, dark }

extension AppThemeModeCode on AppThemeMode {
  String get storageValue => name;

  static AppThemeMode fromStorageValue(String? value) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.storageValue == value,
      orElse: () => AppThemeMode.dark,
    );
  }
}
