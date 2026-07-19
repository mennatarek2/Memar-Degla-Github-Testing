import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_screen_body.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Execlusive Offers"),
      bottomNavigationBar: CustomizedNavigationBar(),
      body: Padding(
        padding: EdgeInsets.all(AppPaddings.horizontalPadding),
        child: OffersScreenBody(),
      ),
    );
  }
}
