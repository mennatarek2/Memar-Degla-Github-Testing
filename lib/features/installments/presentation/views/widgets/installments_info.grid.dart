import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installment_info_item.dart';

class InstallmentInfoGrid extends StatelessWidget {
  const InstallmentInfoGrid({super.key, required this.installment});

  final InstallmentModel installment;

  @override
  Widget build(BuildContext context) {
    final items = <({IconData icon, String label, String value})>[
      (
        icon: Icons.calendar_today_outlined,
        label: 'installments.dueDate'.tr(),
        value: installment.dueDate,
      ),
      (
        icon: Icons.home_work_outlined,
        label: 'installments.unitCode'.tr(),
        value: installment.unitCode,
      ),
      (
        icon: Icons.payment_outlined,
        label: 'installments.method'.tr(),
        value: '-',
      ),
      (
        icon: Icons.document_scanner,
        label: 'installments.contracts'.tr(),
        value: 'CNT-2024-0042',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InstallmentInfoItem(
          icon: item.icon,
          label: item.label,
          value: item.value,
        );
      },
    );
  }
}
