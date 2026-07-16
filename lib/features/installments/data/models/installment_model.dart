import 'package:memar_degla/features/installments/domain/entities/bill_status_entity.dart';

class InstallmentModel {
  final String price;
  final String dueDate;
  final String unitCode;
  final BillStatus billStatus;

  InstallmentModel({
    required this.price,
    required this.dueDate,
    required this.unitCode,
    required this.billStatus,
  });
}

final List<InstallmentModel> installments = [
  InstallmentModel(
    price: "450,000",
    dueDate: "15 Dec 2024",
    unitCode: "VL-042-B",
    billStatus: BillStatus.paid,
  ),
  InstallmentModel(
    price: "450,000",
    dueDate: "15 Jan 2025",
    unitCode: "VL-042-B",
    billStatus: BillStatus.upcoming,
  ),
  InstallmentModel(
    price: "450,000",
    dueDate: "15 Feb 2025",
    unitCode: "VL-042-B",
    billStatus: BillStatus.due,
  ),
  InstallmentModel(
    price: "450,000",
    dueDate: "15 Mar 2024",
    unitCode: "VL-042-B",
    billStatus: BillStatus.overdue,
  ),
];
