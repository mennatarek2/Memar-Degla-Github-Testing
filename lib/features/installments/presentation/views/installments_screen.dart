import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installments_screen_body.dart';

class InstallmentsScreen extends StatelessWidget {
  const InstallmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Current Installments"),
      body: InstallmentsScreenBody(),
    );
  }
}
