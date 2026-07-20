import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/contrcats/domain/contracts_entity.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/contract_status_bagde.dart';

class ContractDetailsContainer extends StatelessWidget {
  const ContractDetailsContainer({
    super.key,
    required this.contractCode,

    required this.unitCode,

    required this.unitPrice,

    required this.paymentProgress,
    required this.status,
  });

  final String contractCode;

  final String unitCode;

  final String unitPrice;
  final ContractsStatus status;

  /// 0.0 -> 1.0
  final double paymentProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(contractCode, style: AppStyles.styleBold30(context)),
              ContractStatusBadge(status: status),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Unit",
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(color: context.colors.textSecondary),
              ),
              const Spacer(),
              Text(
                unitCode,
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: context.colors.textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "Total Price",
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(color: context.colors.textSecondary),
              ),
              const Spacer(),
              Text(
                unitPrice,
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: context.colors.navActive),
              ),
            ],
          ),
          const SizedBox(height: 20),
          PaymentProgressBar(progress: paymentProgress),
        ],
      ),
    );
  }
}

class PaymentProgressBar extends StatelessWidget {
  const PaymentProgressBar({
    super.key,
    required this.progress, // 0.0 -> 1.0
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    final clamped = progress.clamp(0.0, 1.0);
    final percentageText = '${(clamped * 100).round()}%';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Payment Progress',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            Text(
              percentageText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: LinearProgressIndicator(
            value: clamped,
            minHeight: 10,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colors.offerGreen,
            ),
          ),
        ),
      ],
    );
  }
}
