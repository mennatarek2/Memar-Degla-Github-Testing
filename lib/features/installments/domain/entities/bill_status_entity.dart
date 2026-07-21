import 'dart:ui';

import 'package:flutter/material.dart';

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

/// Presentation-only UI mapping for [BillStatus].
///
/// The domain enum (`BillStatus`) stays pure Dart — no Flutter imports.
/// Anything Flutter-specific (Color, IconData) lives here instead, so the
/// domain layer never depends on the framework.
extension BillStatusUiX on BillStatus {
  Color get color => switch (this) {
    BillStatus.paid => const Color(0xFF2E7D32), // green
    BillStatus.upcoming => const Color(0xFF1565C0), // blue
    BillStatus.due => const Color(0xFFEF6C00), // orange
    BillStatus.overdue => const Color(0xFFC62828), // red
  };

  IconData get icon => switch (this) {
    BillStatus.paid => Icons.check_circle_outline,
    BillStatus.upcoming => Icons.schedule_outlined,
    BillStatus.due => Icons.error_outline,
    BillStatus.overdue => Icons.warning_amber_outlined,
  };
}
