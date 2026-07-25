import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/redeem_points_screen_body.dart';

class RedeemPointsScreen extends StatelessWidget {
  const RedeemPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomizedNavigationBar(),
      appBar: CustomAppBar(title: 'contracts.redeem_your_points'.tr()),
      body: const RedeemPointsScreenBody(),
    );
  }
}
