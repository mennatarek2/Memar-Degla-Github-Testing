import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/app_colors.dart';

/// Creates a two-stop diagonal gradient from a single brand color.
LinearGradient buildOfferGradient(Color base, Brightness brightness) {
  final hsl = HSLColor.fromColor(base);

  final Color start;
  final Color end;

  if (brightness == Brightness.light) {
    start = hsl.withLightness((hsl.lightness + 0.08).clamp(0.0, 1.0)).toColor();

    end = hsl
        .withLightness((hsl.lightness - 0.10).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation + 0.08).clamp(0.0, 1.0))
        .toColor();
  } else {
    start = hsl.withLightness((hsl.lightness + 0.05).clamp(0.0, 1.0)).toColor();

    end = hsl
        .withLightness((hsl.lightness - 0.14).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation - 0.05).clamp(0.0, 1.0))
        .toColor();
  }

  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [start, end],
  );
}

/// Predefined gradients for offer types.
class OfferGradients {
  const OfferGradients._();

  static LinearGradient earlyPaymentBonus(
    AppColors colors,
    Brightness brightness,
  ) {
    return buildOfferGradient(colors.offerNavy, brightness);
  }

  static LinearGradient referralDoublePoints(
    AppColors colors,
    Brightness brightness,
  ) {
    return buildOfferGradient(colors.offerOrange, brightness);
  }

  static LinearGradient ramadanSpecialOffer(
    AppColors colors,
    Brightness brightness,
  ) {
    return buildOfferGradient(colors.offerGreen, brightness);
  }
}
