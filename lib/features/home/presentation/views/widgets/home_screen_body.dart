import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/widgets/points_card.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/custom_sections_container.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/next_payment_due.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/quick_actions.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.horizontalPadding,
        vertical: AppPaddings.verticalPadding,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.unitDetails);
                  },

                  child: const PointsCard(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.units);
                    },
                    child: const FeatureSectionDisplay(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.contracts);
                    },
                    child: const ContractDisplaySection(),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 120, child: QuickActions()),
          ),
          const SliverToBoxAdapter(child: Column(children: [NextPaymentDue()])),
        ],
      ),
    );
  }
}
