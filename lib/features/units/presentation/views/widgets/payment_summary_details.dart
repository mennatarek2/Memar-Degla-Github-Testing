import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

class PaymentSummaryDetails extends StatelessWidget {
  const PaymentSummaryDetails({
    super.key,
    required this.textColor,
    required this.unitTotalPrice,
    required this.title,
  });

  final Color textColor;
  final String unitTotalPrice;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleMedium18(context).copyWith(color: textColor),
        ),
        Text(
          "EGP $unitTotalPrice",
          style: AppStyles.styleSemiBold18(context).copyWith(color: textColor),
        ),
      ],
    );
  }
}
