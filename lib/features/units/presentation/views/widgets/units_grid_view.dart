import 'package:flutter/material.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/unit_details_grid_view_item.dart';

class UnitsDetailsGridView extends StatelessWidget {
  const UnitsDetailsGridView({
    super.key,
    required this.bedroomsNumber,
    required this.bathroomsNumber,
    required this.constructionEndDate,
    required this.buildingName,
    required this.floorNumber,
    required this.area,
  });
  final int bedroomsNumber, bathroomsNumber;
  final String constructionEndDate;
  final String buildingName;
  final String floorNumber;
  final double area;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 16,
      childAspectRatio: 0.9,

      children: [
        UnitDetailsGridViewItem(
          title: "Bedrooms",
          subtitle: bedroomsNumber.toString(),
          icon: Icons.bed_outlined,
        ),
        UnitDetailsGridViewItem(
          title: "Bathrooms",
          subtitle: bathroomsNumber.toString(),
          icon: Icons.bathtub_outlined,
        ),
        UnitDetailsGridViewItem(
          title: "Area",
          subtitle: area.toString(),
          icon: Icons.arrow_outward_rounded,
        ),
        UnitDetailsGridViewItem(
          title: "Floor",
          subtitle: floorNumber,
          icon: Icons.layers_outlined,
        ),
        UnitDetailsGridViewItem(
          title: "Building",
          subtitle: buildingName,
          icon: Icons.home_outlined,
        ),
        UnitDetailsGridViewItem(
          title: "Consturction Date",
          subtitle: constructionEndDate,
          icon: Icons.calendar_month_outlined,
        ),
      ],
    );
  }
}
