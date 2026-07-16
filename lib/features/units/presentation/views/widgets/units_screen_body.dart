import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/data/models/units_model.dart';
import 'package:memar_degla/features/units/presentation/widgets/unit_card.dart';

class UnitsScreenBody extends StatelessWidget {
  const UnitsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPaddings.verticalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: units.length,
                itemBuilder: (context, index) {
                  return UnitCard(
                    unit: units[index],
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRoutes.unitDetails, extra: unitDetails[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
