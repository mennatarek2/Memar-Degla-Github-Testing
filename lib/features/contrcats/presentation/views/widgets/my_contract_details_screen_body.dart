import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';
import 'package:memar_degla/features/contrcats/domain/contracts_entity.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/contract_details_container.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/contracts_terms.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/installments_details.dart';

class MyContractDetailsScreenBody extends StatelessWidget {
  const MyContractDetailsScreenBody({super.key, required this.contract});
  final ContractsModels contract;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.horizontalPadding,
          vertical: AppPaddings.verticalPadding,
        ),
        child: Column(
          children: [
            ContractDetailsContainer(
              contractCode: contract.contrcatCode,
              unitCode: contract.unitCode,
              unitPrice: contract.unitPrice,
              paymentProgress: 0.67,
              status: ContractsStatus.active,
            ),

            const SizedBox(height: 30),
            ContractsTerms(contractsTerms: contract.contractsTerms),
            const SizedBox(height: 20),
            InstallmentsDetails(installments: contract.installmentDetails),
          ],
        ),
      ),
    );
  }
}
