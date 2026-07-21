import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/widgets/bullet_items.dart';

class UnitFeaturesDetails extends StatelessWidget {
  const UnitFeaturesDetails({super.key, required this.unitFeature});
  final List<String> unitFeature;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('units.features'.tr(), style: AppStyles.styleSemiBold20(context)),
        const SizedBox(height: 20),
        Column(
          children: unitFeature
              .map((items) => BulletItem(text: items))
              .toList(),
        ),
      ],
    );
  }
}
