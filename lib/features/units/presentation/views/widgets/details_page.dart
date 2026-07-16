import 'package:flutter/material.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/payment_summary.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/units_features.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/units_grid_view.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this._unitDetailsModel});
  final UnitDetailsModel _unitDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UnitsDetailsGridView(
          bedroomsNumber: _unitDetailsModel.bedroomsNumber,
          bathroomsNumber: _unitDetailsModel.bathroomsNumber,
          constructionEndDate: _unitDetailsModel.constructionEndDate,
          buildingName: _unitDetailsModel.buildingName,
          floorNumber: _unitDetailsModel.floorNumber,
          area: _unitDetailsModel.area,
        ),

        UnitFeaturesDetails(unitFeature: _unitDetailsModel.unitFeatures),
        const SizedBox(height: 20),
        PaymentSummary(unitTotalPrice: _unitDetailsModel.unit.unitPrice),
      ],
    );
  }
}
