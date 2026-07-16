import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/units/data/models/units_model.dart';
import 'package:memar_degla/features/units/presentation/widgets/unit_status_badge.dart';

class UnitCard extends StatelessWidget {
  final UnitsModel unit;
  final VoidCallback? onTap;

  const UnitCard({
    super.key,
    required this.unit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: context.colors.border.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Top Row with Icon, Code, Subtitle, and Status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Building Icon Container
                Container(
                  decoration:
                      ContainersStyle.profileItemIconContainer(context),
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.apartment,
                    color: context.colors.icon,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                // Unit Code and Subtitle Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.code,
                        style: AppStyles.styleBold16(context).copyWith(
                          color: context.colors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        unit.unitName,
                        style: AppStyles.styleSemiBold16(context).copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Unit Status Badge
                UnitStatusBadge(status: unit.status),
              ],
            ),
            const SizedBox(height: 16),
            // Bottom Row with Price and Forward Icon
            Row(
              children: [
                Text(
                  '${unit.unitPrice} EGP',
                  style: TextStyle(
                    color: context.colors.navActive,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.colors.icon,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
