enum UnitStatus {
  active,
  handOver,
  underConstructions;

  String get label => switch (this) {
    UnitStatus.active => "Active",
    UnitStatus.handOver => "HandOver",
    UnitStatus.underConstructions => " Under Construction",
  };
}
