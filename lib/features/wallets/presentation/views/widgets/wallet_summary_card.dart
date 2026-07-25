import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

import 'package:memar_degla/core/themes/theme_extention.dart';

/// "Wallet Summary" card — outer card uses
/// [ContainersStyle.profileItemContainer], each inner row reuses
/// [ContainersStyle.frequentlyAskedQuestions] for its bordered look.
class WalletSummaryCard extends StatelessWidget {
  const WalletSummaryCard({
    super.key,
    required this.totalEarned,
    required this.redeemed,
    required this.expired,
  });

  final String totalEarned;
  final String redeemed;
  final String expired;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wallet Summary', style: AppStyles.styleBold20(context)),
          const SizedBox(height: 8),
          Text(
            'Track your balance, redeemed points, and expiring points in one place.',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: 18),
          _SummaryRow(
            icon: Icons.trending_up_rounded,
            iconColor: colors.primaryGold,
            iconBackground: colors.iconGoldBg,
            label: 'Total Earned',
            value: totalEarned,
            valueColor: colors.primaryGold,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.card_giftcard_rounded,
            iconColor: colors.success,
            iconBackground: colors.iconGreenBg,
            label: 'Redeemed',
            value: redeemed,
            valueColor: colors.success,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.error_outline_rounded,
            iconColor: colors.error,
            iconBackground: colors.error.withValues(alpha: 0.12),
            label: 'Expired',
            value: expired,
            valueColor: colors.error,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: ContainersStyle.frequentlyAskedQuestions(context),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppStyles.styleMedium16(context))),
          Text(
            value,
            style: AppStyles.styleBold18(context).copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }
}
