import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class OnHoldPointsContainer extends StatelessWidget {
  const OnHoldPointsContainer({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: AppPaddings.containerPadding,
      ),
      decoration: ContainersStyle.onHoldPointsContainer(context),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: context.colors.primaryGold),
          const SizedBox(width: 5),
          Text(
            title ?? "",
            style: AppStyles.styleMedium16(
              context,
            ).copyWith(color: context.colors.primaryGold),
          ),
        ],
      ),
    );
  }
}
