import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/constants/assets.dart';
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
                      style: AppStyles.styleSemiBold30(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ContainersStyle.profileItemIconContainer(
                        context,
                      ),
                      child: const FaIcon(FontAwesomeIcons.buildingUser),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Units",
                      style: AppStyles.styleSemiBold24(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 10,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: context.colors.textPrimary,
                      ),
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
                      "2",
                      style: AppStyles.styleSemiBold30(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: ContainersStyle.profileItemIconContainer(
                        context,
                      ),
                      child: Image.asset(
                        Assets.assetsIconsMyContractIcon,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Contracts",
                      style: AppStyles.styleSemiBold24(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 10,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: context.colors.textPrimary,
                      ),
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
