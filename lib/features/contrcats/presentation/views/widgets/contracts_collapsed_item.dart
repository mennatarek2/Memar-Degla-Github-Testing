import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/contrcats/domain/contracts_entity.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/contract_status_bagde.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/unit_details.dart';

class ContractsCollapsedItem extends StatelessWidget {
  final String contractCode;
  final String contractAgreement;
  final String price;
  final ContractsStatus status;
  final String unitCode;

  const ContractsCollapsedItem({
    super.key,
    required this.contractCode,
    required this.contractAgreement,
    required this.price,
    required this.status,
    required this.unitCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Icon, Title, and Status
          Row(
            children: [
              // Rounded container with contract icon
              Container(
                decoration: ContainersStyle.profileItemIconContainer(context),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.description_outlined,
                  color: context.colors.icon,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              // Column with contract name and unit name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contractCode,
                      style: AppStyles.styleSemiBold30(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        contractAgreement,
                        style: AppStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: context.colors.textSecondary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              // Status badge
              ContractStatusBadge(status: status),
            ],
          ),
          const SizedBox(height: 16),
          // Unit Details Row
          UnitDetails(price: price, unitCode: unitCode),
          const SizedBox(height: 16),
          // Footer Row with Price and Details Button
          Row(
            children: [
              Text(
                price,
                style: AppStyles.styleSemiBold30(
                  context,
                ).copyWith(color: context.colors.navActive),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'details'.tr(),
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.colors.textPrimary,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
