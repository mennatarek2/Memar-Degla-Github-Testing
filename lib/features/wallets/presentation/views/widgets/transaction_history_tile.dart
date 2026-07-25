import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

import 'package:memar_degla/core/themes/theme_extention.dart';

/// "View Transaction History" row. Per spec this does NOT navigate —
/// its tap handler is left as a TODO for whoever wires up the feature.
class TransactionHistoryTile extends StatelessWidget {
  const TransactionHistoryTile({super.key});

  void _onViewTransactionHistory() {
    // TODO: wire this up once the transaction history feature exists
    // (e.g. open a bottom sheet, or navigate via GoRouter).
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: _onViewTransactionHistory,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: ContainersStyle.profileItemContainer(context),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: ContainersStyle.profileItemIconContainer(context),
                child: Icon(Icons.receipt_long_rounded, color: colors.icon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'View Transaction History',
                      style: AppStyles.styleBold18(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'See all point activity, rewards, and redemptions.',
                      style: AppStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_rounded, color: colors.icon),
            ],
          ),
        ),
      ),
    );
  }
}
