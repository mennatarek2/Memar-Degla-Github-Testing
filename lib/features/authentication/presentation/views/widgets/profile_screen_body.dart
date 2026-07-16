import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/constants/assets.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/helpers/dialogs.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/custom_red_button.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/profile_item_widget.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/user_contact_info_widget.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.horizontalPadding,
          vertical: AppPaddings.verticalPadding,
        ),
        child: Column(
          children: [
            // User Contact Info Widget
            const UserContactInfoWidget(
              email: 'ahmed@email.com',
              phone: '+966 55 123 4567',
            ),
            const SizedBox(height: 20),
            Divider(thickness: 1, color: context.colors.iconBackGround),
            // Profile Items Container
            Container(
              decoration: ContainersStyle.profileItemContainer(context),
              padding: const EdgeInsets.all(AppPaddings.containerPadding),
              child: Column(
                children: [
                  // Settings
                  ProfileItemWidget(
                    titleKey: 'profile.settings',
                    iconPath: Assets.assetsIconsSettingsIcon,
                    onTap: () {
                      // TODO: Navigate to settings screen
                    },
                  ),
                  Divider(thickness: 1, color: context.colors.iconBackGround),
                  // My Contracts
                  ProfileItemWidget(
                    titleKey: 'profile.my_contracts',
                    iconPath: Assets.assetsIconsMyContractIcon,
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.contracts);
                      // TODO: Navigate to my contracts screen
                    },
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 1, color: context.colors.iconBackGround),
                  // Installments
                  ProfileItemWidget(
                    titleKey: 'profile.installments',
                    iconPath: Assets.assetsIconsInstallmentIcon,
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.installments);
                    },
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 1, color: context.colors.iconBackGround),
                  // Referral
                  ProfileItemWidget(
                    titleKey: 'profile.referral',
                    iconPath: Assets.assetsIconsReferralsIcon,
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.units);
                    },
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 1, color: context.colors.iconBackGround),
                  // Documents
                  ProfileItemWidget(
                    titleKey: 'profile.documents',
                    iconPath: Assets.assetsIconsFolderIcon,
                    onTap: () {
                      router.push(AppRoutes.documents);
                    },
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 1.5, color: context.colors.iconBackGround),
                  // Support
                  ProfileItemWidget(
                    titleKey: 'profile.support',
                    iconPath: Assets.assetsIconsSupportIcon,
                    onTap: () {
                      router.push(AppRoutes.support);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomRedButton(
              onPressed: () {
                RedeemConfirmationDialog.show(
                  context,
                  title: 'Log Out',
                  message: 'Are you sure you want to Logout',
                  onConfirm: () => GoRouter.of(context).pop(),
                  onCancel: () {},
                );
              },
              title: "Log out",
            ),
          ],
        ),
      ),
    );
  }
}
