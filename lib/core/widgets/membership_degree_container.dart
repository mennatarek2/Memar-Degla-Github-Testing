import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class MemberShipDegreeContainer extends StatelessWidget {
  const MemberShipDegreeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ContainersStyle.memberShipDegreeContainer(context),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "home.membership_degree".tr(),
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(color: context.colors.navActive),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
