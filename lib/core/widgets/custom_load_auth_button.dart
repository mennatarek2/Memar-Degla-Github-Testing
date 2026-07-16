import 'package:flutter/material.dart';

import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomLoadingAuthButton extends StatelessWidget {
  const CustomLoadingAuthButton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final VoidCallback? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: ContainersStyle.authButtonStyle.copyWith(
        color: colors.buttonBg,
        borderRadius: BorderRadius.circular(20),
      ),

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.styleSemiBold24(
            context,
          ).copyWith(color: colors.primaryGold),
        ),
      ),
    );
  }
}

//TODO add the requried text files and the required responsive texts and the required responsive sizes and the required responsive paddings and margins and the required responsive fonts and the required responsive colors and the required responsive icons and the required responsive images and the required responsive buttons and the required responsive textfields and the required responsive checkboxes and the required responsive radios and the required responsive switches and the required responsive sliders and the required responsive progress indicators and the required responsive dialogs and the required responsive snackbars and the required responsive toasts and the required responsive alerts and the required responsive notifications and the required responsive menus and the required responsive tabs and the required responsive drawers and the required responsive bottom sheets and the required responsive app bars and the required responsive toolbars and the required responsive navigation bars and the required responsive floating action buttons
