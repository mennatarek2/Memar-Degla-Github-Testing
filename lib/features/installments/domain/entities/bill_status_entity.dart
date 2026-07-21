enum BillStatus {
  paid,
  upcoming,
  overdue,
  due;

  String get label => switch (this) {
    BillStatus.paid => 'installments.paid',
    BillStatus.upcoming => 'installments.upcoming',
    BillStatus.overdue => 'installments.overdue',
    BillStatus.due => 'installments.due',
  };
}
