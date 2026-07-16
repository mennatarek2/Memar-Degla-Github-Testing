import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class SignWithSingleOtp extends StatelessWidget {
  const SignWithSingleOtp({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        "auth.signInWithSingleOtp".tr(),
        style: AppStyles.styleMedium16(
          context,
        ).copyWith(color: context.colors.textSecondary),
      ),
    );
  }
}
