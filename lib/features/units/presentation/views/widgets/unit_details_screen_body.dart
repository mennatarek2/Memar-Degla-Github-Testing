import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/unit_galary.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/units_details_page_view.dart';

class UnitDetailsScreenBody extends StatelessWidget {
  const UnitDetailsScreenBody({super.key, required this._unitDetailsModel});
  final UnitDetailsModel _unitDetailsModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UnitGalleryStack(
                imageUrls: const [
                  Assets.assetsImagesVillaNakheel,
                  Assets.assetsImagesTowerDegla,
                  Assets.assetsImagesTownhousePearl,
                ],
                unitType: "Appartment",
                unitCode: "VLC-004",
                unitStatus: _unitDetailsModel.unit.status,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPaddings.horizontalPadding,
                  vertical: AppPaddings.verticalPadding,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _unitDetailsModel.unit.code,
                          style: AppStyles.styleSemiBold24(context),
                        ),
                        Text(
                          "EGP ${_unitDetailsModel.unit.unitPrice}",

                          style: AppStyles.styleSemiBold20(
                            context,
                          ).copyWith(color: context.colors.navActive),
                        ),
                      ],
                    ),
                    UnitsDetailsPageView(unitDetailsModel: _unitDetailsModel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
