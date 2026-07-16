import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class OnHoldPointsContainer extends StatelessWidget {
  const OnHoldPointsContainer({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ContainersStyle.onHoldPointsContainer(context),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            color: context.colors.navActive.withValues(alpha: 0.6),
          ),
          Text(
            title ?? "",
            style: AppStyles.styleMedium16(
              context,
            ).copyWith(color: context.colors.navActive.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }
}
