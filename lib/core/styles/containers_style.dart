import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

abstract class ContainersStyle {
  static BoxDecoration get authButtonStyle =>
      BoxDecoration(borderRadius: BorderRadius.circular(10));
  static ShapeDecoration pointsContainer(BuildContext context) =>
      ShapeDecoration(
        color: context.colors.offerNavy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: context.colors.border, width: 1.5),
        ),
      );
  static ShapeDecoration memberShipDegreeContainer(BuildContext context) =>
      ShapeDecoration(
        color: const Color(0xFF422C0D).withValues(alpha: 0.9),
        shadows: [
          BoxShadow(
            offset: const Offset(0, 0.5),
            color: context.colors.navActive,
            blurRadius: 0.2,
            spreadRadius: 1,
            blurStyle: BlurStyle.solid,
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: context.colors.navActive, width: 1.5),
        ),
      );
  static ShapeDecoration onHoldPointsContainer(BuildContext context) =>
      ShapeDecoration(
        color: const Color(0xFF3E3E35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: context.colors.border, width: 1.5),
        ),
        shadows: [
          BoxShadow(
            offset: const Offset(0, 0.5),
            color: context.colors.navActive,
            blurRadius: 0.2,
            spreadRadius: 1,
            blurStyle: BlurStyle.solid,
          ),
        ],
      );
  static BoxDecoration redButtonStyle(BuildContext context) => BoxDecoration(
    color: context.colors.error.withValues(alpha: 0.06),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: context.colors.error, width: 1.2),
  );
  static BoxDecoration contractsAndUnitsContainer(BuildContext context) =>
      BoxDecoration(
        color: context.colors.offerNavy,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(color: context.colors.primaryGold, width: 2),
        ),
      );
  static BoxDecoration profileItemContainer(BuildContext context) =>
      BoxDecoration(
        color: context.colors.containerBackground,
        borderRadius: BorderRadius.circular(20),
      );
  static BoxDecoration profileItemIconContainer(BuildContext context) =>
      BoxDecoration(
        color: context.colors.iconBackGround,
        borderRadius: BorderRadius.circular(12),
      );
  static BoxDecoration frequentlyAskedQuestions(BuildContext context) =>
      BoxDecoration(
        border: Border.all(color: context.colors.iconBackGround),
        color: context.colors.containerBackground,
        borderRadius: BorderRadius.circular(20),
      );
}
