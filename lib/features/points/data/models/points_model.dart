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
  const PointsModel(
    icon: Icons.payments_outlined,
    title: "Installment Discount",
    subtitle:
        "Redeem your points to get a discount on your next installment payment.",
    points: "2,500",
  ),
  const PointsModel(
    icon: Icons.apartment_outlined,
    title: "New Unit Discount",
    subtitle: "Receive a special discount when booking a new residential unit.",
    points: "10,000",
  ),
  const PointsModel(
    icon: Icons.home_work_outlined,
    title: "Property Upgrade",
    subtitle:
        "Use your points toward upgrading your selected unit or finishing package.",
    points: "15,000",
  ),
  const PointsModel(
    icon: Icons.home_outlined,
    title: "Interior Design Consultation",
    subtitle:
        "Redeem a free consultation session with our interior design team.",
    points: "5,000",
  ),
  const PointsModel(
    icon: Icons.handyman_outlined,
    title: "Maintenance Services",
    subtitle: "Exchange your points for home maintenance and repair services.",
    points: "3,500",
  ),
  const PointsModel(
    icon: Icons.local_parking_outlined,
    title: "Parking Space Discount",
    subtitle:
        "Get a discount on purchasing or reserving an additional parking space.",
    points: "7,500",
  ),
];
