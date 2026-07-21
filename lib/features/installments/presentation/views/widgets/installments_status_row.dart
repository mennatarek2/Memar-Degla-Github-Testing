import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';

/// Row showing the installment's [BillStatus] as an icon + localized label,
/// colored per status (paid/upcoming/due/overdue).
class InstallmentStatusRow extends StatelessWidget {
  const InstallmentStatusRow({super.key, required this.status});

  final BillStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: status.color.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 5, backgroundColor: status.color),

          const SizedBox(width: 6),
          Text(
            status.label.tr(),
            style: TextStyle(
              color: status.color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
