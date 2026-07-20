import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.scaffoldBackground,
    required this.surface,
    required this.surfaceVariant,
    required this.primaryGold,
    required this.onPrimaryGold,
    required this.navy,
    required this.onNavy,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.inputBackground,
    required this.success,
    required this.info,
    required this.warning,
    required this.error,
    required this.offerNavy,
    required this.offerOrange,
    required this.offerGreen,
    required this.iconBlueBg,
    required this.iconGreenBg,
    required this.iconGoldBg,
    required this.textFieldBg,
    required this.textFieldIcon,
    required this.navActive,
    required this.navInactive,
    required this.shadow,
    required this.navBarBackground,
    required this.containerBackground,
    required this.icon,
    required this.iconBackGround,
    required this.buttonBg,
    required this.textFieldBorder,
    required this.customizedContainerBg,
  });

  // Base surfaces
  final Color scaffoldBackground; // page background
  final Color surface; // card / sheet background
  final Color surfaceVariant; // secondary card tint (e.g. "My Contracts" tile)

  // Brand
  final Color primaryGold; // logo gold, gold CTA border/fill, "GOLD" badge
  final Color onPrimaryGold; // text/icon color placed ON TOP of primaryGold
  final Color navy; // deep navy used for headers/buttons
  final Color onNavy; // text/icon color placed ON TOP of navy

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  // Inputs / borders
  final Color border;
  final Color inputBackground;

  // Status / semantic colors (badges, states)
  final Color success; // "Active" unit badge
  final Color info; // "Handover" unit badge
  final Color warning; // "Under Construction" badge
  final Color error; // Logout button, "Expired" points
  final Color customizedContainerBg;

  // Offer / campaign card backgrounds
  final Color offerNavy; // "Early Payment Bonus" card
  final Color offerOrange; // "Referral Double Points" card
  final Color offerGreen; // "Ramadan Special Offer" card

  // Icon chip backgrounds (profile menu rows)
  final Color iconBlueBg;
  final Color iconGreenBg;
  final Color iconGoldBg;
  final Color textFieldBg;
  final Color textFieldIcon;

  // Bottom navigation
  final Color navActive;
  final Color navInactive;

  final Color shadow;
  final Color navBarBackground;
  final Color containerBackground;
  final Color icon;
  final Color iconBackGround;
  final Color buttonBg;
  final Color textFieldBorder;

  static const light = AppColors(
    customizedContainerBg: Color(0xFFFFF9ED),
    icon: Color(0xFF1B2A4A),
    scaffoldBackground: Color(0xFFF0F3F7),
    surface: Color(0xFFFFFFFF),
    textFieldBorder: Color(0xFFE6E7EB),
    containerBackground: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFF5EFDD),
    primaryGold: Color(0XFFBFA664),
    onPrimaryGold: Color(0xFF1B2A4A),
    navy: Color(0xFF1B2A4A),
    onNavy: Color(0xFFC9A227),
    textPrimary: Color(0xFF1B2A4A),
    textSecondary: Color(0xFF6B7280),
    textMuted: Color(0xFF9CA3AF),
    border: Color(0xFF1B2A4A),
    inputBackground: Color(0xFFEDEFF3),
    success: Color(0xFF22C55E),
    info: Color(0xFF3B82F6),
    warning: Color(0xFF9CA3AF),
    error: Color(0xFFE74C3C),
    offerNavy: Color(0xFF16233F),
    offerOrange: Color(0xFFE8871E),
    offerGreen: Color.fromARGB(255, 13, 129, 90),
    iconBlueBg: Color(0xFFDCE9F7),
    iconGreenBg: Color(0xFFDCF5E7),
    iconGoldBg: Color(0xFFF5E9D0),
    textFieldBg: Color(0xFFEFF0F4),
    textFieldIcon: Color(0XFF6E727D),
    navActive: Color(0xFFC9A227),
    navInactive: Color(0xFF9AA0AC),
    shadow: Color.fromARGB(255, 19, 18, 18),
    navBarBackground: Color(0xFFF5F5F5),
    iconBackGround: Color(0xFFEDEEF1),
    buttonBg: Color(0xFF1B2A4A),
  );

  static const dark = AppColors(
    customizedContainerBg: Color(0xFF3E3E35),
    navBarBackground: Color(0xFF171A23),
    scaffoldBackground: Color(0xFF0B0B0F),
    surface: Color(0xFF171A23),
    textFieldBorder: Color(0xFF262D37),
    surfaceVariant: Color(0xFF1A2540),
    primaryGold: Color(0XFFBFA664),
    onPrimaryGold: Color(0xFFC9A227),
    navy: Color(0xFF16233F),
    onNavy: Color(0xFF1B2A4A),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFB0B4BD),
    textMuted: Color(0xFF6B7280),
    border: Color(0xFFC9A227),
    inputBackground: Color(0xFF1E212B),
    success: Color(0xFF22C55E),
    info: Color(0xFF3B82F6),
    warning: Color(0xFF9CA3AF),
    error: Color(0xFFEF4444),
    offerNavy: Color(0xFF171D24),
    offerOrange: Color(0xFFE8871E),
    offerGreen: Color.fromARGB(255, 13, 129, 90),
    iconBlueBg: Color(0xFF1B2B45),
    iconGreenBg: Color(0xFF163A2A),
    iconGoldBg: Color(0xFF3A2E14),
    textFieldBg: Color(0xff1D2228),
    textFieldIcon: Color(0XFF8C909B),
    navActive: Color(0xFFD4AF37),
    navInactive: Color(0xFF6B7280),
    shadow: Color(0xFFFFFFFF),
    containerBackground: Color(0xFF171C26),
    icon: Color(0xFFA99A75),
    iconBackGround: Color(0XFF262729),
    buttonBg: Color(0xFFC5A24D),
  );

  @override
  AppColors copyWith({
    Color? customizedContainerBg,
    Color? scaffoldBackground,
    Color? surface,
    Color? surfaceVariant,
    Color? primaryGold,
    Color? onPrimaryGold,
    Color? navy,
    Color? onNavy,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? inputBackground,
    Color? success,
    Color? info,
    Color? warning,
    Color? error,
    Color? offerNavy,
    Color? offerOrange,
    Color? offerGreen,
    Color? iconBlueBg,
    Color? iconGreenBg,
    Color? iconGoldBg,
    Color? iconPurpleBg,
    Color? iconTealBg,
    Color? navActive,
    Color? navInactive,
    Color? shadow,
    Color? navBarBackground,
    Color? containerBackground,
    Color? icon,
    Color? iconBackGround,
    Color? buttonBg,
    Color? textFieldBorder,
  }) {
    return AppColors(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      primaryGold: primaryGold ?? this.primaryGold,
      onPrimaryGold: onPrimaryGold ?? this.onPrimaryGold,
      navy: navy ?? this.navy,
      onNavy: onNavy ?? this.onNavy,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      inputBackground: inputBackground ?? this.inputBackground,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      offerNavy: offerNavy ?? this.offerNavy,
      offerOrange: offerOrange ?? this.offerOrange,
      offerGreen: offerGreen ?? this.offerGreen,
      iconBlueBg: iconBlueBg ?? this.iconBlueBg,
      iconGreenBg: iconGreenBg ?? this.iconGreenBg,
      iconGoldBg: iconGoldBg ?? this.iconGoldBg,
      textFieldBg: iconPurpleBg ?? textFieldBg,
      textFieldIcon: iconTealBg ?? textFieldIcon,
      navActive: navActive ?? this.navActive,
      navInactive: navInactive ?? this.navInactive,
      shadow: shadow ?? this.shadow,
      navBarBackground: navBarBackground ?? this.navBarBackground,
      containerBackground: containerBackground ?? this.containerBackground,
      icon: icon ?? this.icon,
      iconBackGround: iconBackGround ?? this.iconBackGround,
      buttonBg: buttonBg ?? this.buttonBg,
      customizedContainerBg:
          customizedContainerBg ?? this.customizedContainerBg,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      scaffoldBackground: Color.lerp(
        scaffoldBackground,
        other.scaffoldBackground,
        t,
      )!,
      surface: Color.lerp(surface, other.surface, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      primaryGold: Color.lerp(primaryGold, other.primaryGold, t)!,
      onPrimaryGold: Color.lerp(onPrimaryGold, other.onPrimaryGold, t)!,
      navy: Color.lerp(navy, other.navy, t)!,
      onNavy: Color.lerp(onNavy, other.onNavy, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      success: Color.lerp(success, other.success, t)!,
      info: Color.lerp(info, other.info, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      offerNavy: Color.lerp(offerNavy, other.offerNavy, t)!,
      offerOrange: Color.lerp(offerOrange, other.offerOrange, t)!,
      offerGreen: Color.lerp(offerGreen, other.offerGreen, t)!,
      iconBlueBg: Color.lerp(iconBlueBg, other.iconBlueBg, t)!,
      iconGreenBg: Color.lerp(iconGreenBg, other.iconGreenBg, t)!,
      iconGoldBg: Color.lerp(iconGoldBg, other.iconGoldBg, t)!,
      textFieldBg: Color.lerp(textFieldBg, other.textFieldBg, t)!,
      textFieldIcon: Color.lerp(textFieldIcon, other.textFieldIcon, t)!,
      navActive: Color.lerp(navActive, other.navActive, t)!,
      navInactive: Color.lerp(navInactive, other.navInactive, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      navBarBackground: Color.lerp(
        navBarBackground,
        other.navBarBackground,
        t,
      )!,
      containerBackground: Color.lerp(
        containerBackground,
        other.containerBackground,
        t,
      )!,
      icon: Color.lerp(icon, other.icon, t)!,
      iconBackGround: Color.lerp(iconBackGround, other.iconBackGround, t)!,
      buttonBg: Color.lerp(buttonBg, other.buttonBg, t)!,
      customizedContainerBg: Color.lerp(
        containerBackground,
        other.customizedContainerBg,
        t,
      )!,
    );
  }
}
