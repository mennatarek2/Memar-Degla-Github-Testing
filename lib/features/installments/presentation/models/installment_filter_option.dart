import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';

class InstallmentFilterOption {
  final String label;
  final BillStatus? status;

  InstallmentFilterOption({required this.label, this.status});
}

final List<InstallmentFilterOption> filterOptions = [
  InstallmentFilterOption(label: 'All'),
  InstallmentFilterOption(label: 'Due', status: BillStatus.due),
  InstallmentFilterOption(label: 'Paid', status: BillStatus.paid),
  InstallmentFilterOption(label: 'Overdue', status: BillStatus.overdue),
  InstallmentFilterOption(label: 'Upcoming', status: BillStatus.upcoming),
];
