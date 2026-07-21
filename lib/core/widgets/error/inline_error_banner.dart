import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../error/failures.dart';
import '../../presentation/failure_ui_mapper.dart';

/// For partial failures — e.g. a "related items" widget fails to load
/// but the rest of the screen is fine. Use this instead of AppErrorWidget
/// so a small failure doesn't take over the whole screen.
class InlineErrorBanner extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const InlineErrorBanner({super.key, required this.failure, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final ui = failure.toUiModel();
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(ui.icon, size: 20, color: theme.colorScheme.onErrorContainer),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ui.message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          if (ui.canRetry && onRetry != null)
            TextButton(onPressed: onRetry, child: Text('common.retry'.tr())),
        ],
      ),
    );
  }
}

void showErrorSnackBar(
  BuildContext context,
  Failure failure, {
  VoidCallback? onRetry,
}) {
  final ui = failure.toUiModel();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(ui.message),
      action: ui.canRetry && onRetry != null
          ? SnackBarAction(label: 'common.retry'.tr(), onPressed: onRetry)
          : null,
    ),
  );
}
