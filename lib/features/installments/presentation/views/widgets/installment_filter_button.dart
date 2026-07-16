import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/installments/presentation/models/installment_filter_option.dart';

class InstallmentFilterButton extends StatelessWidget {
  final InstallmentFilterOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const InstallmentFilterButton({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colors.onPrimaryGold : colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? colors.navy
                : colors.border.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Text(
          option.label,
          style: TextStyle(
            color: isSelected ? colors.primaryGold : colors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
