import 'package:flutter/material.dart';
import 'package:memar_degla/core/helpers/size_config.dart';
import 'package:memar_degla/core/themes/app_colors.dart';
import 'package:memar_degla/core/themes/app_theme.dart';

abstract class AppStyles {
  static AppColors _colors(BuildContext context) => AppTheme.colors(context);

  static TextStyle styleMedium18(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMediumLight24(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium13(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular13(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold56(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 56),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold30(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold38(BuildContext context) {
    final colors = _colors(context);
    return TextStyle(
      color: colors.textPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 38),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
