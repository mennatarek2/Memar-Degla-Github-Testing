import 'package:flutter/material.dart';
import 'package:memar_degla/constants/assets.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/bill_status_container.dart';

class InstallmentCard extends StatelessWidget {
  final InstallmentModel installment;
  final VoidCallback? onTap;

  const InstallmentCard({super.key, required this.installment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.containerBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: context.colors.border.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Image Container
            Container(
              decoration: ContainersStyle.profileItemIconContainer(context),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                Assets.assetsIconsInstallmentIcon,
                width: 24,
                height: 24,
                color: context.colors.icon,
              ),
            ),
            const SizedBox(width: 20),
            // Price and Due Date Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${installment.price} EGP',
                    style: AppStyles.styleBold16(context).copyWith(
                      color: context.colors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Due: ${installment.dueDate}',
                    style: AppStyles.styleMedium16(context).copyWith(
                      color: context.colors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Bill Status Container
            BillStatusContainer(billStatus: installment.billStatus),
          ],
        ),
      ),
    );
  }
}
