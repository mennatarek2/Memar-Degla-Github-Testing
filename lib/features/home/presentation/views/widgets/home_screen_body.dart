import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/points_card.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/custom_sections_container.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/next_payment_due.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/offers_page_view.dart';
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
            child: AspectRatio(aspectRatio: 3, child: QuickActions()),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const NextPaymentDue(),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Active Offers",
                      style: AppStyles.styleBold24(context),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () =>
                          GoRouter.of(context).push(AppRoutes.offers),
                      child: Text(
                        "View All",
                        style: AppStyles.styleBold20(
                          context,
                        ).copyWith(color: context.colors.primaryGold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AspectRatio(
                  aspectRatio: 1.6,
                  child: OffersCardsPageView(
                    onTap: () => GoRouter.of(context).push(AppRoutes.offers),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),

          // const SliverFillRemaining(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
