import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/custom_load_auth_button.dart';
import 'package:memar_degla/core/widgets/sucess_widget.dart';
import 'package:memar_degla/features/points/data/models/points_model.dart';

class PointsItem extends StatelessWidget {
  const PointsItem({super.key, required this.item});

  final PointsModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: ContainersStyle.profileItemIconContainer(context),
                child: Center(
                  child: Icon(item.icon, color: context.colors.textPrimary),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: AppStyles.styleSemiBold20(context)),
                    Text(
                      item.subtitle,
                      style: AppStyles.styleMedium16(
                        context,
                      ).copyWith(color: context.colors.textSecondary),
                    ),
                    Text(
                      '${item.points} Points',
                      style: AppStyles.styleBold16(
                        context,
                      ).copyWith(color: context.colors.navActive),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomLoadingAuthButton(
            title: 'points.redeem'.tr(),
            onPressed: () {
              ResponseSuccessCustomized.show(
                context,
                message: 'points.points_redeemed_successfully'.tr(),
                imagePath: Assets.assetsImagesCheck,
                // displayDuration: const Duration(milliseconds: 3),
              );
            },
          ),
        ],
      ),
    );
  }
}
