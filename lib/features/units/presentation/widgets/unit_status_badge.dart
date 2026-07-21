import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/units/domain/entities/unit_entity.dart';

class UnitStatusBadge extends StatelessWidget {
  final UnitStatus status;

  const UnitStatusBadge({super.key, required this.status});

  Color _getStatusBackgroundColor(UnitStatus status) {
    return switch (status) {
      UnitStatus.active => const Color(0xFFDFF4EC),
      UnitStatus.handOver => const Color(0xFFE4EFFC),
      UnitStatus.underConstructions => const Color(0xFFEFF0F4),
    };
  }

  Color _getStatusDotColor(BuildContext context, UnitStatus status) {
    return switch (status) {
      UnitStatus.active => context.colors.success,
      UnitStatus.handOver => context.colors.info,
      UnitStatus.underConstructions => context.colors.warning,
    };
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getStatusBackgroundColor(status);
    final dotColor = _getStatusDotColor(context, status);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: dotColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
          const SizedBox(width: 8),
          Text(
            status.label(context),
            style: TextStyle(
              color: dotColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
