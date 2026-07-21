/// Supported app languages.
///
/// Pure Dart enum — domain layer must never import Flutter, so the
/// mapping to display labels / locale codes lives in a presentation-side
/// extension, not here.
enum AppLanguage { en, ar }

extension AppLanguageCode on AppLanguage {
  /// ISO language code, used for `Locale(code)` and persistence.
  String get code {
    switch (this) {
      case AppLanguage.en:
        return 'en';
      case AppLanguage.ar:
        return 'ar';
    }
  }

  static AppLanguage fromCode(String code) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => AppLanguage.en,
    );
  }
}
