import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/app_colors.dart';

class OnboardingPageItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colors.onPrimaryGold,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.textSecondary, fontSize: 16),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
