import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/custom_loading_auth_button.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/email_text_field.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/customized_text_field.dart';
import 'package:memar_degla/features/profile/presentation/views/widgets/profile_picture_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fullNameController = TextEditingController(text: 'Ahmed Mohamed');
  final _emailController = TextEditingController(text: 'ahmed@email.com');
  final _phoneController = TextEditingController(text: '+201234567890');
  final _customerCodeController = TextEditingController(text: 'CUST-1024');

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _customerCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: CustomAppBar(title: 'profile.edit_profile_details'.tr()),
      bottomNavigationBar: const CustomizedNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const ProfilePictureCircularCard(
                      size: 112,
                      enableAutoFlip: false,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'profile.tap_to_change_photo'.tr(),
                      style: AppStyles.styleMedium16(
                        context,
                      ).copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              _buildFieldLabel(context, 'profile.full_name'.tr()),
              const SizedBox(height: 10),
              CustomizedTextField(
                label: 'profile.full_name'.tr(),
                controller: _fullNameController,
              ),
              const SizedBox(height: 16),
              _buildFieldLabel(context, 'profile.email'.tr()),
              const SizedBox(height: 10),
              EmailTextField(
                label: 'profile.email'.tr(),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildFieldLabel(context, 'profile.phone_number'.tr()),
              const SizedBox(height: 10),
              CustomizedTextField(
                label: 'profile.phone_number'.tr(),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              _buildFieldLabel(context, 'profile.customer_code'.tr()),
              const SizedBox(height: 10),
              CustomizedTextField(
                label: 'profile.customer_code'.tr(),
                controller: _customerCodeController,
              ),
              const SizedBox(height: 28),
              CustomLoadingAuthButton(
                title: 'profile.save_changes'.tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    final colors = context.colors;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: AppStyles.styleSemiBold16(
          context,
        ).copyWith(color: colors.textSecondary),
      ),
    );
  }
}
