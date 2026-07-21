import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PointsModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String points;

  const PointsModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.points,
  });
}

List<PointsModel> redeemPointsList = [
  PointsModel(
    icon: Icons.payments_outlined,
    title: 'points.installment_discount'.tr(),
    subtitle: 'points.installment_discount_desc'.tr(),
    points: '2,500',
  ),
  PointsModel(
    icon: Icons.apartment_outlined,
    title: 'points.new_unit_discount'.tr(),
    subtitle: 'points.new_unit_discount_desc'.tr(),
    points: '10,000',
  ),
  PointsModel(
    icon: Icons.home_work_outlined,
    title: 'points.property_upgrade'.tr(),
    subtitle: 'points.property_upgrade_desc'.tr(),
    points: '15,000',
  ),
  PointsModel(
    icon: Icons.home_outlined,
    title: 'points.interior_design_consultation'.tr(),
    subtitle: 'points.interior_design_consultation_desc'.tr(),
    points: '5,000',
  ),
  PointsModel(
    icon: Icons.handyman_outlined,
    title: 'points.maintenance_services'.tr(),
    subtitle: 'points.maintenance_services_desc'.tr(),
    points: '3,500',
  ),
  PointsModel(
    icon: Icons.local_parking_outlined,
    title: 'points.parking_space_discount'.tr(),
    subtitle: 'points.parking_space_discount_desc'.tr(),
    points: '7,500',
  ),
];
