import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

import 'package:memar_degla/core/themes/theme_extention.dart';

class InstallmentInfoItem extends StatelessWidget {
  const InstallmentInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: ContainersStyle.profileItemIconContainer(context),
            child: Icon(icon, color: context.colors.primaryGold, size: 20),
          ),
          const SizedBox(width: 10),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Text(
                    label,
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: context.colors.textSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: AppStyles.styleBold20(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
