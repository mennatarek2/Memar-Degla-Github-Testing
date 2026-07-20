import 'package:easy_localization/easy_localization.dart';
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
          title: 'units.bedrooms'.tr(),
          subtitle: bedroomsNumber.toString(),
          icon: Icons.bed_outlined,
        ),
        UnitDetailsGridViewItem(
          title: 'units.bathrooms'.tr(),
          subtitle: bathroomsNumber.toString(),
          icon: Icons.bathtub_outlined,
        ),
        UnitDetailsGridViewItem(
          title: 'units.area'.tr(),
          subtitle: area.toString(),
          icon: Icons.arrow_outward_rounded,
        ),
        UnitDetailsGridViewItem(
          title: 'units.floor'.tr(),
          subtitle: floorNumber,
          icon: Icons.layers_outlined,
        ),
        UnitDetailsGridViewItem(
          title: 'units.building'.tr(),
          subtitle: buildingName,
          icon: Icons.home_outlined,
        ),
        UnitDetailsGridViewItem(
          title: 'units.construction_date'.tr(),
          subtitle: constructionEndDate,
          icon: Icons.calendar_month_outlined,
        ),
      ],
    );
  }
}
