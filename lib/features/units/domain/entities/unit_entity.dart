import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum UnitStatus {
  active,
  handOver,
  underConstructions;

  String label(BuildContext context) => switch (this) {
    UnitStatus.active => context.tr('units.active'),
    UnitStatus.handOver => context.tr('units.hand_over'),
    UnitStatus.underConstructions => context.tr('units.under_construction'),
  };
}
