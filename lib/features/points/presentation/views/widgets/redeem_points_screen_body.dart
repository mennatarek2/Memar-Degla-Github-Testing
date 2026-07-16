import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/points/data/models/points_model.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/redeem_points_item.dart';
// import your CustomLoadingAuthButton here

class RedeemPointsScreenBody extends StatelessWidget {
  const RedeemPointsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    return Padding(
      padding: const EdgeInsets.all(AppPaddings.horizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: ContainersStyle.profileItemContainer(context),
                  padding: const EdgeInsets.all(AppPaddings.containerPadding),
                  child: Row(
                    children: [
                      Container(
                        decoration: ContainersStyle.profileItemIconContainer(
                          context,
                        ),
                        padding: const EdgeInsets.all(
                          AppPaddings.containerPadding,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.gift,
                          color: color.navActive,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Available Balance",
                            style: AppStyles.styleMedium16(
                              context,
                            ).copyWith(color: color.textSecondary),
                          ),
                          Text(
                            '12,450 Points',
                            style: AppStyles.styleSemiBold24(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverList.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: redeemPointsList.length,
            itemBuilder: (context, index) {
              return PointsItem(item: redeemPointsList[index]);
            },
          ),
        ],
      ),
    );
  }
}
