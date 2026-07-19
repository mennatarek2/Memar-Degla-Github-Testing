import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.offersBenfits,
    required this.offerType,
    required this.title,
    required this.endDate,
    required this.subtitle,
  });
  final Color backgroundColor;
  final IconData icon;
  final String offersBenfits, offerType, title, endDate, subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPaddings.containerPadding),
                decoration: ContainersStyle.profileItemIconContainer(context),
                child: Icon(icon),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: ContainersStyle.profileItemIconContainer(context),
                child: Text(
                  offersBenfits,
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: context.colors.navActive),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: ContainersStyle.profileItemIconContainer(context),
                child: Text(
                  offerType,
                  style: AppStyles.styleMedium13(
                    context,
                  ).copyWith(color: context.colors.navActive),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppStyles.styleSemiBold18(
              context,
            ).copyWith(color: context.colors.textPrimary),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: AppStyles.styleMedium13(
              context,
            ).copyWith(color: context.colors.textSecondary),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.timelapse_outlined),
              const SizedBox(width: 5),
              Text(
                endDate,
                style: AppStyles.styleMedium13(
                  context,
                ).copyWith(color: context.colors.textMuted),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    "Details",
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
