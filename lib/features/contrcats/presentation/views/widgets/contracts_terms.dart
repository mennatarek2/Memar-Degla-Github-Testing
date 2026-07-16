import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/widgets/bullet_items.dart';

class ContractsTerms extends StatelessWidget {
  const ContractsTerms({super.key, required this.contractsTerms});
  final List<String> contractsTerms;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.profileItemContainer(context),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contrcat Terms and Conditions",
            style: AppStyles.styleSemiBold20(context),
          ),
          const SizedBox(height: 20),
          Column(
            children: contractsTerms
                .map((items) => BulletItem(text: items))
                .toList(),
          ),
        ],
      ),
    );
  }
}
