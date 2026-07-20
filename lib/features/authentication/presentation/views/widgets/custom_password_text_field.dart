import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "auth.thisFieldCantBeEmpty".tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    const pillRadius = BorderRadius.all(Radius.circular(100));

    // One fixed border for every interaction state — focus no longer
    // changes color at all, only the cursor appears.
    final fixedBorder = BorderSide(color: colors.textFieldBorder);

    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      validator: widget.validator ?? _defaultValidator,
      onChanged: widget.onChanged,
      style: AppStyles.styleMedium18(
        context,
      ).copyWith(color: colors.textPrimary),
      cursorColor: colors.textPrimary,
      decoration: InputDecoration(
        hintText: widget.label,
        hintStyle: AppStyles.styleMedium18(
          context,
        ).copyWith(color: colors.textFieldIcon),
        filled: true,
        fillColor: colors.textFieldBg,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: colors.textFieldIcon,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        prefixIcon: Icon(Icons.lock_outline, color: colors.textFieldIcon),
        border: OutlineInputBorder(
          borderRadius: pillRadius,
          borderSide: fixedBorder,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: pillRadius,
          borderSide: fixedBorder,
        ),
        focusedBorder: OutlineInputBorder(
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
