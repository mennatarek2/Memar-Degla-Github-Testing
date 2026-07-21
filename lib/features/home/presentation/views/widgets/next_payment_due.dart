import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';

class NextPaymentDue extends StatelessWidget {
  const NextPaymentDue({super.key});

  @override
  Widget build(BuildContext context) {
    final lastInstallment = installments[0];
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${'home.payment_due'.tr()}:',
          style: AppStyles.styleSemiBold24(context),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: ContainersStyle.profileItemContainer(context),
          padding: const EdgeInsets.all(AppPaddings.containerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: ContainersStyle.profileItemIconContainer(context)
                    .copyWith(
                      boxShadow: [
                        BoxShadow(
                          color: colors.surfaceVariant.withValues(alpha: 0.9),
                          // color: Colors.red,
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                padding: const EdgeInsets.all(AppPaddings.containerPadding),
                child: Icon(Icons.credit_card, color: colors.navActive),
              ),

              const SizedBox(width: 20),
              _UnitData(
                unitCode: lastInstallment.unitCode,
                dueDate: lastInstallment.dueDate,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount:",
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: colors.textSecondary),
                  ),

                  Text(
                    "EGP ${lastInstallment.price}",
                    style: AppStyles.styleBold24(
                      context,
                    ).copyWith(color: colors.navActive),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UnitData extends StatelessWidget {
  const _UnitData({required this.unitCode, required this.dueDate});
  final String unitCode;
  final String dueDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(unitCode, style: AppStyles.styleBold24(context)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.colors.navActive.withValues(alpha: 0.1),
          ),
          child: Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: FaIcon(
                  size: 15,
                  FontAwesomeIcons.calendarDays,
                  color: context.colors.navActive.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                dueDate,
                style: AppStyles.styleMedium13(
                  context,
                ).copyWith(color: context.colors.navActive.withValues()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
