import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/counter_text.dart';
import 'package:memar_degla/core/widgets/membership_degree_container.dart';
import 'package:memar_degla/core/widgets/on_hold_points_container.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.pointsContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "home.loyality_points".tr(),
                style: AppStyles.styleMedium16(context).copyWith(
                  color: context.colors.navActive,

                  shadows: [
                    const Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: Color(0xFF422C0D),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const MemberShipDegreeContainer(),
            ],
          ),
          const SizedBox(height: 30),
          const CounterText(targetValue: 12250),
          const SizedBox(height: 10),
          Row(
            children: [
              OnHoldPointsContainer(title: "850 ${"home.on_hold_points".tr()}"),
              const SizedBox(width: 10),
              Text(
                "~ EGP 1250",
                style: AppStyles.styleSemiBold24(context).copyWith(
                  color: context.colors.navActive.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
