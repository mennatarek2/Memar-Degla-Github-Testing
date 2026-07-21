import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_screen_body.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'contracts.exclusive_offers'.tr()),
      bottomNavigationBar: const CustomizedNavigationBar(),
      body: const Padding(
        padding: EdgeInsets.all(AppPaddings.horizontalPadding),
        child: OffersScreenBody(),
      ),
    );
  }
}
