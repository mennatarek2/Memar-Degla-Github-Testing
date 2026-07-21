import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class FeatureSectionDisplay extends StatelessWidget {
  const FeatureSectionDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.contractsAndUnitsContainer(
        context,
      ).copyWith(color: context.colors.containerBackground),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "4",
                      style: AppStyles.styleBold30(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ContainersStyle.profileItemIconContainer(
                        context,
                      ).copyWith(color: const Color(0XFFF7F0DE)),
                      child: FaIcon(
                        FontAwesomeIcons.buildingUser,
                        color: context.colors.primaryGold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "nav.units".tr(),
                      style: AppStyles.styleSemiBold24(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: context.colors.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ContractDisplaySection extends StatelessWidget {
  const ContractDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.contractsAndUnitsContainer(context).copyWith(
        // color: context.colors.containerBackground
        color: context.colors.customizedContainerBg,
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "3",
                      style: AppStyles.styleBold30(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ContainersStyle.profileItemIconContainer(
                        context,
                      ).copyWith(color: const Color(0xFFF7F0DE)),
                      child: Image.asset(
                        Assets.assetsIconsMyContractIcon,
                        color: context.colors.primaryGold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "contracts.my_contracts".tr(),
                        style: AppStyles.styleSemiBold24(
                          context,
                        ).copyWith(color: context.colors.textPrimary),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: context.colors.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
