import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Amount banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(),
              decoration: BoxDecoration(
                // TODO(Mostafa): confirm the real nav color token name.
                color: context.colors.navy,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${installment.price} ${'installments.egp'.tr()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Status row
            InstallmentStatusRow(status: installment.billStatus),
            const SizedBox(height: 16),

            // 2-column detail grid
            InstallmentInfoGrid(installment: installment),
            const SizedBox(height: 24),

            // Pay now button
            // CustomAuth(
            //   // TODO(Mostafa): match the actual param names on your button.
            //   text: 'installments.payNow'.tr(),
            //   onPressed: () {
            //     // TODO: wire up the payment flow / call the relevant use case.
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
