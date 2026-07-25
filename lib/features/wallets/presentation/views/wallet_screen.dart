import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/wallets/presentation/views/widgets/wallet_screen_body.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "My Wallet"),
      bottomNavigationBar: CustomizedNavigationBar(),
      body: WalletScreenBody(),
    );
  }
}
