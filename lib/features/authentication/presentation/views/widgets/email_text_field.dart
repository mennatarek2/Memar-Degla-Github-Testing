import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "auth.thisFieldCantBeEmpty".tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final fixedBorder = BorderSide(color: colors.textFieldBorder);
    const pillRadius = BorderRadius.all(Radius.circular(20));

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator ?? _defaultValidator,
      onChanged: onChanged,
      style: AppStyles.styleMedium18(
        context,
      ).copyWith(color: colors.textPrimary),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: AppStyles.styleMedium18(
          context,
        ).copyWith(color: colors.textFieldIcon),
        filled: true,
        fillColor: colors.textFieldBg,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        prefixIcon: Icon(Icons.email_outlined, color: colors.textFieldIcon),

        enabledBorder: OutlineInputBorder(
          borderRadius: pillRadius,
          borderSide: fixedBorder,
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: pillRadius,
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: pillRadius,
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
      ),
    );
  }
}
