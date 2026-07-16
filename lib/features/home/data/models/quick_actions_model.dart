import 'package:flutter/material.dart';
import 'package:memar_degla/constants/assets.dart';
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
    actionTitle: "Installment",
    imageColor: const Color(0xFF5620E0),
    navigationPath: AppRoutes.installments,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsContractIcon,
    actionTitle: "Documents",
    imageColor: const Color(0XFF536DCF),
    navigationPath: AppRoutes.contracts,
    //TODO edit the navigation here this navigation path just for testing purpose
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsGiftIcon,
    actionTitle: "Redeem",
    imageColor: const Color(0xFFD9A876),
    navigationPath: AppRoutes.redeem,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsSupport,
    actionTitle: "Support",
    imageColor: const Color(0XFF5FA3B4),
    navigationPath: AppRoutes.support,
  ),
  QuickActionsModel(
    imagePath: Assets.assetsIconsReferalIcon,
    actionTitle: "Referal",
    imageColor: const Color(0XFF5B967A),
    navigationPath: AppRoutes.referrals,
  ),
];
// TODO Edit the navgation path
