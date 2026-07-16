import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'my_contracts_screen_body.dart';

class MyContractsScreen extends StatelessWidget {
  const MyContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My Contracts'),
      body: MyContractsScreenBody(),
      bottomNavigationBar: CustomizedNavigationBar(),
    );
  }
}
