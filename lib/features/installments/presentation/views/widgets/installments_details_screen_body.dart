import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/custom_load_auth_button.dart';

import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installments_info.grid.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installments_status_row.dart';

class InstallmentDetailsScreenBody extends StatelessWidget {
  const InstallmentDetailsScreenBody({super.key, required this.installment});

  final InstallmentModel installment;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Amount banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppPaddings.containerPadding),
              decoration: BoxDecoration(
                color: context.colors.navy,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${installment.price} EGP',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold34(
                      context,
                    ).copyWith(color: context.colors.primaryGold),
                  ),
                  const SizedBox(height: 20),

                  // Status row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InstallmentStatusRow(status: installment.billStatus),
                      const SizedBox(width: 10),
                      Text(
                        installment.dueDate,
                        style: AppStyles.styleBold16(context).copyWith(
                          color: context.colors.primaryGold.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 2-column detail grid
            InstallmentInfoGrid(installment: installment),
            const SizedBox(height: 24),

            Visibility(
              visible: installment.billStatus.index != 0,
              child: CustomLoadingAuthButton(
                title: 'installments.payNow'.tr(),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
