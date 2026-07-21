import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/my_contract_details_screen_body.dart';

class MyContractsDetailsScreen extends StatelessWidget {
  const MyContractsDetailsScreen({super.key, required this.contractsModels});
  final ContractsModels contractsModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'contracts.contract_details'.tr()),
      body: MyContractDetailsScreenBody(contract: contractsModels),
    );
  }
}
