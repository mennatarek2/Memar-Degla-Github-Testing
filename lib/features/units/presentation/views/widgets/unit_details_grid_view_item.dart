import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class UnitDetailsGridViewItem extends StatelessWidget {
  const UnitDetailsGridViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: ContainersStyle.profileItemIconContainer(context),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, color: context.colors.navActive),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              maxLines: 2,
              title,
              style: AppStyles.styleMedium16(
                context,
              ).copyWith(color: context.colors.textSecondary),
            ),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              subtitle,
              style: AppStyles.styleBold16(
                context,
              ).copyWith(color: context.colors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
