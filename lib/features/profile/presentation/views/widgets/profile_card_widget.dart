import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/profile/presentation/views/widgets/profile_picture_card.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.userName,
    required this.userID,
    required this.userTier,
  });

  final String userName;
  final String userID;
  final String userTier;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ContainersStyle.profileItemContainer(
        context,
      ).copyWith(color: context.colors.navy),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Profile Picture and Edit Button
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const ProfilePictureCircularCard(size: 130),
              // Edit Button
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.editProfile);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.navy,
                    border: Border.all(color: context.colors.surface, width: 2),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: context.colors.primaryGold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // User Name
          Text(
            userName,
            style: AppStyles.styleBold30(
              context,
            ).copyWith(color: context.colors.primaryGold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // User ID
          Text(
            userID,
            style: AppStyles.styleSemiBold18(
              context,
            ).copyWith(color: context.colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // User Tier Badge
          Container(
            decoration: BoxDecoration(
              color: context.colors.primaryGold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: context.colors.primaryGold, width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 14, color: context.colors.primaryGold),
                const SizedBox(width: 6),
                Text(
                  userTier,
                  style: AppStyles.styleMedium16(context).copyWith(
                    color: context.colors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Description Text
          Text(
            'profile.profile_description'.tr(),
            style: AppStyles.styleMedium16(
              context,
            ).copyWith(color: context.colors.textMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
