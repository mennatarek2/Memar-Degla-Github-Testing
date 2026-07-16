import 'package:flutter/material.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/unit_details_screen_body.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({super.key, required this._unitDetailsModel});
  final UnitDetailsModel _unitDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnitDetailsScreenBody(unitDetailsModel: _unitDetailsModel),
    );
  }
}
