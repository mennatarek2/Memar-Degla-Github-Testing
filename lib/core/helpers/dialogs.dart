// redeem_confirmation_dialog.dart
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/custom_load_auth_button.dart';

import 'package:memar_degla/core/widgets/custom_red_button.dart';

class RedeemConfirmationDialog extends StatelessWidget {
  const RedeemConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;

  /// Convenience static method so callers don't need to build
  /// the widget manually every time.
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    return showDialog(
      context: context,
      builder: (_) => RedeemConfirmationDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Dialog(
      backgroundColor: colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.styleSemiBold20(context),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: 24),
            CustomLoadingAuthButton(
              title: confirmText,
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
            const SizedBox(height: 12),
            CustomRedButton(
              title: cancelText,
              onPressed: () {
                Navigator.of(context).pop();
                onCancel();
              },
            ),
          ],
        ),
      ),
    );
  }
}
