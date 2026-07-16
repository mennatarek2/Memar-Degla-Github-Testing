import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class UnitDetails extends StatelessWidget {
  const UnitDetails({super.key, required this.price, required this.unitCode});

  final String price, unitCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First Unit Detail Container with Home Icon
        Expanded(
          child: Container(
            decoration: ContainersStyle.profileItemIconContainer(context),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.home_outlined, color: context.colors.icon, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ' Unit: $unitCode',
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Second Unit Detail Container with Money Icon
        Expanded(
          child: Container(
            decoration: ContainersStyle.profileItemIconContainer(context),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  color: context.colors.icon,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    price,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
