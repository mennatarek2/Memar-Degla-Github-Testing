import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int current;

  const PageIndicator({super.key, required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool active = index == current;
        if (active) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: 36,
            height: 8,
            decoration: BoxDecoration(
              color: colors.primaryGold,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: colors.navInactive,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
