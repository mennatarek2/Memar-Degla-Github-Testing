import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
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

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator ?? _defaultValidator,
      onChanged: onChanged,
      // style: TextStyle(color: colors.lightPrimaryFont),
      decoration: InputDecoration(
        hintText: label,
        helperStyle: TextStyle(color: colors.textPrimary),

        fillColor: colors.textSecondary.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
