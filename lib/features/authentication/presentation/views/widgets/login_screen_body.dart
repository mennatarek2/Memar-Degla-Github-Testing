import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/custom_loading_auth_button.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/custom_password_text_field.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/email_text_field.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/sign_with_single_otp.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.horizontalPadding,
          vertical: AppPaddings.verticalPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(Assets.assetsImagesDeglaBlackLogo),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  softWrap: true,
                  locale: context.locale,
                  "auth.welcome_Back".tr(),
                  style: AppStyles.styleBold32(
                    context,
                  ).copyWith(color: colors.onPrimaryGold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "auth.signInToContinue".tr(),
                  style: AppStyles.styleSemiBold18(
                    context,
                  ).copyWith(color: colors.textSecondary),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "auth.enterEmail".tr(),
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: 10),
              EmailTextField(
                onChanged: (value) {
                  // Handle email input change
                },
                label: "auth.email".tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Text(
                "auth.enterPassword".tr(),
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: 10),
              CustomPasswordTextField(
                onChanged: (value) {
                  // Handle password input change
                },
                label: "auth.password".tr(),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password button press
                  },
                  child: Text(
                    "auth.forgotPassword".tr(),
                    style: AppStyles.styleBold18(
                      context,
                    ).copyWith(color: colors.onPrimaryGold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomLoadingAuthButton(
                title: "auth.login".tr(),
                onPressed: () {
                  // Handle login button press
                  if (_formKey.currentState!.validate()) {
                    GoRouter.of(context).go(AppRoutes.home);
                  }
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: SignWithSingleOtp(
                  onPressed: () {
                    // Handle sign in with single OTP button press
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
