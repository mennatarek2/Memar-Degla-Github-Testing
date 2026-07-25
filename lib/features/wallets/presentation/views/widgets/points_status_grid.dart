import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

import 'points_status_card.dart';

/// Fixed 2xN [GridView] of the wallet's point status cards
/// (Pending / Redeemed / Expired / Total Earned). It's embedded inside a
/// scrolling parent, so it doesn't scroll on its own.
class PointsStatusGrid extends StatelessWidget {
  const PointsStatusGrid({
    super.key,
    required this.pending,
    required this.redeemed,
    required this.expired,
    required this.totalEarned,
  });

  final String pending;
  final String redeemed;
  final String expired;
  final String totalEarned;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.5,
      children: [
        PointsStatusCard(
          icon: Icons.access_time_rounded,
          iconBackground: colors.iconGoldBg,
          iconColor: colors.primaryGold,
          value: pending,
          label: 'Pending',
        ),
        PointsStatusCard(
          icon: Icons.card_giftcard_rounded,
          iconBackground: colors.iconGreenBg,
          iconColor: colors.success,
          value: redeemed,
          label: 'Redeemed',
        ),
        PointsStatusCard(
          icon: Icons.error_outline_rounded,
          iconBackground: colors.error.withValues(alpha: 0.12),
          iconColor: colors.error,
          value: expired,
          label: 'Expired',
        ),
        PointsStatusCard(
          icon: Icons.auto_awesome_rounded,
          iconBackground: colors.customizedContainerBg,
          iconColor: colors.primaryGold,
          value: totalEarned,
          label: 'Total Earned',
        ),
      ],
    );
  }
}
