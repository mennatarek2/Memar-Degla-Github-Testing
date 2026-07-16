import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/support_screen_body.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Support"),
      body: SupportScreenBody(),
    );
  }
}
