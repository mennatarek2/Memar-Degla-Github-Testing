import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/progress_bar.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/payment_summary_details.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key, required this.unitTotalPrice});
  final String unitTotalPrice;
  @override
  Widget build(BuildContext context) {
    final textColor = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'units.payment_summary'.tr(),
            style: AppStyles.styleSemiBold24(context),
          ),
          const SizedBox(height: 20),
          PaymentSummaryDetails(
            textColor: textColor.textMuted,
            unitTotalPrice: unitTotalPrice,
            title: 'units.total_price'.tr(),
          ),
          const SizedBox(height: 10),
          PaymentSummaryDetails(
            textColor: textColor.offerGreen,
            unitTotalPrice: unitTotalPrice,
            title: 'units.paid_60'.tr(),
          ),
          const SizedBox(height: 10),

          PaymentSummaryDetails(
            textColor: textColor.navActive,
            unitTotalPrice: unitTotalPrice,
            title: 'units.remaining_40'.tr(),
          ),
          const SizedBox(height: 20),
          const PaymentProgressBar(progress: 0.60),
        ],
      ),
    );
  }
}
