enum ContractsStatus {
  active,
  completed;

  String get label => switch (this) {
    ContractsStatus.active => "Active",
    ContractsStatus.completed => "Completed",
  };
}
