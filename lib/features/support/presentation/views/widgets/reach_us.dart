import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class ReachUs extends StatelessWidget {
  const ReachUs({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle;
  final FaIconData icon;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: colors.offerGreen.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(icon),
          const SizedBox(height: 10),
          Text(title, style: AppStyles.styleSemiBold20(context)),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: AppStyles.styleMedium16(
              context,
            ).copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
