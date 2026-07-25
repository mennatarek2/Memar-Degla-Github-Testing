import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/points_card.dart';

import 'points_status_grid.dart';
import 'transaction_history_tile.dart';

import 'wallet_summary_card.dart';

class WalletScreenBody extends StatelessWidget {
  const WalletScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PointsCard(),
                  SizedBox(height: 20),
                  PointsStatusGrid(
                    pending: '850',
                    redeemed: '3,200',
                    expired: '120',
                    totalEarned: '16,620',
                  ),
                  SizedBox(height: 20),
                  WalletSummaryCard(
                    totalEarned: '16,620',
                    redeemed: '3,200',
                    expired: '120',
                  ),
                  SizedBox(height: 16),
                  TransactionHistoryTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
