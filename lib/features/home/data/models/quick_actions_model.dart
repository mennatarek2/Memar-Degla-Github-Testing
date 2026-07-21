import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/routes/app_routes.dart';

class QuickActionsModel {
  final String imagePath;
  final String actionTitle;
  final Color imageColor;
  final String navigationPath;

  QuickActionsModel({
    required this.imagePath,
    required this.actionTitle,
    required this.imageColor,
    required this.navigationPath,
  });
}

List<QuickActionsModel> quickActionsModel = [
  QuickActionsModel(
    imagePath: Assets.assetsIconsCardIcon,
    actionTitle: 'profile.installments'.tr(),
    imageColor: const Color(0xFF5620E0),
    navigationPath: AppRoutes.installments,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsContractIcon,
    actionTitle: 'profile.documents'.tr(),
    imageColor: const Color(0XFF536DCF),
    navigationPath: AppRoutes.documents,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsGiftIcon,
    actionTitle: 'points.redeem'.tr(),
    imageColor: const Color(0xFFD9A876),
    navigationPath: AppRoutes.redeem,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsSupport,
    actionTitle: 'profile.support'.tr(),
    imageColor: const Color(0XFF5FA3B4),
    navigationPath: AppRoutes.support,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsReferalIcon,
    actionTitle: 'profile.referral'.tr(),
    imageColor: const Color(0XFF5B967A),
    navigationPath: AppRoutes.referrals,
  ),
];
