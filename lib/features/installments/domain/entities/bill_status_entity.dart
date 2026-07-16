enum BillStatus {
  paid,
  upcoming,
  overdue,
  due;

  String get label => switch (this) {
    BillStatus.paid => "Paid",
    BillStatus.upcoming => "Upcoming",
    BillStatus.overdue => "Overdue",
    BillStatus.due => "Due",
  };
}
