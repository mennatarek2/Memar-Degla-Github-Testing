import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/app_theme.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colors(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: colors.scaffoldBackground,
      child: Center(
        child: Image.asset(
          'assets/images/degla_black_logo.png',
          width: 220,
          height: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
