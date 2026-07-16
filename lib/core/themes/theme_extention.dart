import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Adds `context.colors`, `context.textStyles`, and `context.theme`
/// shortcuts so widgets never need `Theme.of(context)` boilerplate.
extension ThemeContextX on BuildContext {
  /// Usage: `context.colors.primaryGold`
  ///
  /// `Theme.of(this)` walks up the widget tree to the nearest [Theme]
  /// (MaterialApp installs one at the root using the ThemeData you
  /// pass to `theme:` / `darkTheme:`).
  /// `.extension<AppColors>()` looks inside that ThemeData's
  /// `extensions` list for an object of type AppColors and returns it.
  /// The `!` is safe ONLY because we guarantee below (in app_theme.dart)
  /// that every ThemeData we build always registers an AppColors
  /// extension — so this can never actually be null at runtime.
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  /// Shortcut for the full ThemeData, in case you need
  /// context.theme.textTheme, context.theme.iconTheme, etc.
  ThemeData get theme => Theme.of(this);

  /// Shortcut for text styles: context.textStyles.titleLarge
  TextTheme get textStyles => Theme.of(this).textTheme;
}
