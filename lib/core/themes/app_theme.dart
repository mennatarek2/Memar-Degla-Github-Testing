import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._(); // static-only class, never instantiated

  static AppColors colors(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  static ThemeData get light => _build(AppColors.light, Brightness.light);

  static ThemeData get dark => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,

      // Standard Flutter widgets (Scaffold, AppBar defaults, etc.)
      // read scaffoldBackgroundColor directly, so we map it from
      // our extracted color, not from ColorScheme.
      scaffoldBackgroundColor: colors.scaffoldBackground,

      // ColorScheme powers built-in Material widgets (ElevatedButton,
      // Checkbox, TextField outlines, etc.) that don't know about our
      // custom AppColors. We map our closest equivalents onto it so
      // every stock widget still looks on-brand automatically.
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primaryGold,
        onPrimary: colors.onPrimaryGold,
        secondary: colors.navy,
        onSecondary: colors.onNavy,
        error: colors.error,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),

      // This is the important part: we attach our own AppColors object
      // to ThemeData's `extensions` list. Any widget can now retrieve
      // it back out via `Theme.of(context).extension<AppColors>()`
      // (which is exactly what `context.colors` does for us).
      extensions: <ThemeExtension<dynamic>>[colors],

      appBarTheme: AppBarTheme(
        backgroundColor: colors.scaffoldBackground,
        foregroundColor: colors.textPrimary,
        elevation: 0,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.navy,
          foregroundColor: colors.onNavy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),

      textTheme: brightness == Brightness.dark
          ? Typography.whiteMountainView
          : Typography.blackMountainView,
    );
  }
}
