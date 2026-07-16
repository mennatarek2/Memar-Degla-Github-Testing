import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';

class BillStatusContainer extends StatelessWidget {
  final BillStatus billStatus;

  const BillStatusContainer({super.key, required this.billStatus});

  Color _getStatusColor(BuildContext context, BillStatus status) {
    return switch (status) {
      BillStatus.paid => context.colors.success,
      BillStatus.upcoming => context.colors.warning,
      BillStatus.overdue => context.colors.error,
      BillStatus.due => context.colors.navActive,
    };
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context, billStatus);

    return Container(
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(radius: 3, backgroundColor: statusColor),
          const SizedBox(width: 5),
          Text(
            billStatus.label,
            style: AppStyles.styleSemiBold16(
              context,
            ).copyWith(color: statusColor),
          ),
        ],
      ),
    );
  }
}
