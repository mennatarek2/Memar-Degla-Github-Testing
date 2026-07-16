import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator ?? _defaultValidator,
      onChanged: onChanged,
      // style: TextStyle(color: colors.lightPrimaryFont),
      decoration: InputDecoration(
        labelText: label,

        helperStyle: TextStyle(color: colors.textPrimary),
        fillColor: colors.textSecondary.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        prefixIcon: Icon(Icons.email, color: colors.textPrimary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
