import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/contrcats/domain/contracts_entity.dart';

class ContractStatusBadge extends StatelessWidget {
  const ContractStatusBadge({super.key, required this.status});
  final ContractsStatus status;
  @override
  Widget build(BuildContext context) {
    final isActive = status == ContractsStatus.active;
    final statusColor = isActive
        ? context.colors.offerGreen
        : context.colors.textSecondary;

    return Container(
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        status.label,
        style: TextStyle(
          color: statusColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
