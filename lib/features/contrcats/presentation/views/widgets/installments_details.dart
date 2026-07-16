import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/bill_status_container.dart';

class InstallmentsDetails extends StatelessWidget {
  const InstallmentsDetails({super.key, required this.installments});
  final List<InstallmentModel> installments;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Installment Schedule",
            style: AppStyles.styleSemiBold20(context),
          ),
          const SizedBox(height: 20),
          Column(
            children: installments
                .map((e) => _InstallmentPaymentDetails(installmentModel: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _InstallmentPaymentDetails extends StatelessWidget {
  const _InstallmentPaymentDetails({required this._installmentModel});
  final InstallmentModel _installmentModel;
  @override
  Widget build(BuildContext context) {
    double installmentNumber = 1;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Column(
              children: [
                Text(
                  "#$installmentNumber - EGP ${_installmentModel.price} ",
                  style: AppStyles.styleSemiBold18(context),
                ),
                Text(
                  " Date:${_installmentModel.dueDate}",
                  style: AppStyles.styleMedium13(
                    context,
                  ).copyWith(color: context.colors.textSecondary),
                ),
              ],
            ),
            const Spacer(),

            BillStatusContainer(billStatus: _installmentModel.billStatus),
          ],
        ),
        const Divider(thickness: 1, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
