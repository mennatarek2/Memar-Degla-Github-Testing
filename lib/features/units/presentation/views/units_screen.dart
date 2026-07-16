import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/units_screen_body.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomizedNavigationBar(),
      appBar: CustomAppBar(title: "Units"),
      body: UnitsScreenBody(),
    );
  }
}
