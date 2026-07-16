import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/manger/cubit/units_details_tab_cubit.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/details_page.dart';
import 'package:memar_degla/features/units/presentation/views/widgets/floor_page.dart';


class UnitsDetailsPageView extends StatelessWidget {
  const UnitsDetailsPageView({super.key, required this.unitDetailsModel});
  final UnitDetailsModel unitDetailsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UnitDetailsTabCubit(),
      child: Column(
        children: [
          const _TabSelector(),
          const SizedBox(height: 16),
          BlocBuilder<UnitDetailsTabCubit, UnitDetailsTab>(
            builder: (context, tab) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: tab == UnitDetailsTab.details
                    ? DetailsPage(
                        key: const ValueKey('details'),
                        unitDetailsModel: unitDetailsModel,
                      )
                    : const FloorPlanPage(key: ValueKey('floorPlan')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TabSelector extends StatelessWidget {
  const _TabSelector();

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<UnitDetailsTabCubit>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Details',
              isSelected: selected == UnitDetailsTab.details,
              onTap: () => context.read<UnitDetailsTabCubit>().select(
                UnitDetailsTab.details,
              ),
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'Floor Plan',
              isSelected: selected == UnitDetailsTab.floorPlan,
              onTap: () => context.read<UnitDetailsTabCubit>().select(
                UnitDetailsTab.floorPlan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: ContainersStyle.profileItemIconContainer(context).copyWith(
          color: isSelected
              ? context.colors.iconBackGround
              : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: isSelected
                ? context.colors.textPrimary
                : context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
