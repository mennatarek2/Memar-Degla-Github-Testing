import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class ProfileItemWidget extends StatelessWidget {
  final String titleKey;
  final String iconPath;
  final VoidCallback onTap;

  const ProfileItemWidget({
    super.key,
    required this.titleKey,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ContainersStyle.profileItemContainer(context),
        padding: const EdgeInsets.all(AppPaddings.containerPadding),
        child: Row(
          children: [
            // Icon container
            Container(
              decoration: ContainersStyle.profileItemIconContainer(context),
              padding: const EdgeInsets.all(12),
              child: Image.asset(iconPath, color: context.colors.icon),
            ),
            const SizedBox(width: 20),
            // Title
            Text(
              titleKey.tr(),
              style: AppStyles.styleSemiBold18(
                context,
              ).copyWith(color: context.colors.textPrimary),
            ),
            const Spacer(),
            // Forward arrow
            Icon(
              Icons.arrow_forward_ios,
              color: context.colors.textPrimary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
