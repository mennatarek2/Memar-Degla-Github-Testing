// custom_red_button.dart
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomRedButton extends StatelessWidget {
  const CustomRedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: ContainersStyle.redButtonStyle(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: colors.error, size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: AppStyles.styleBold20(
                  context,
                ).copyWith(color: colors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
