import 'package:easy_localization/easy_localization.dart';
import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';

class InstallmentFilterOption {
  final String label;
  final BillStatus? status;

  InstallmentFilterOption({required this.label, this.status});
}

final List<InstallmentFilterOption> filterOptions = [
  InstallmentFilterOption(label: 'installments.all'.tr()),
  InstallmentFilterOption(
    label: 'installments.due'.tr(),
    status: BillStatus.due,
  ),
  InstallmentFilterOption(
    label: 'installments.paid'.tr(),
    status: BillStatus.paid,
  ),
  InstallmentFilterOption(
    label: 'installments.overdue'.tr(),
    status: BillStatus.overdue,
  ),
  InstallmentFilterOption(
    label: 'installments.upcoming'.tr(),
    status: BillStatus.upcoming,
  ),
];
