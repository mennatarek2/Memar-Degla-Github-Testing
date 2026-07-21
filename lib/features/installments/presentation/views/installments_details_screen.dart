import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installments_details_screen_body.dart';

class InstallmentsDetailsScreen extends StatelessWidget {
  const InstallmentsDetailsScreen({super.key, required this.installment});
  final InstallmentModel installment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "installment.installments_details".tr()),
      body: InstallmentDetailsScreenBody(installment: installment),
    );
  }
}
