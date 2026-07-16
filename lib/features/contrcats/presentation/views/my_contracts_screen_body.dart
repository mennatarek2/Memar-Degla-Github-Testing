import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';
import 'widgets/contracts_collapsed_item.dart';

class MyContractsScreenBody extends StatelessWidget {
  const MyContractsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - Replace with actual data from your provider/bloc

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: dumyyContractModel.length,
      itemBuilder: (context, index) {
        final contract = dumyyContractModel[index];
        return GestureDetector(
          onTap: () => GoRouter.of(
            context,
          ).push(AppRoutes.myCoontractsDetails, extra: contract),
          child: ContractsCollapsedItem(
            contractCode: contract.contrcatCode,
            contractAgreement: contract.contractAgreement,
            price: contract.unitPrice,
            status: contract.contractsStatus,
            unitCode: contract.unitCode,
          ),
        );
      },
    );
  }
}
