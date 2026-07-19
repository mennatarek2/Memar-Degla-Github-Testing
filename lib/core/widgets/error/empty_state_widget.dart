import 'package:flutter/material.dart';

/// "No data" is not the same as "something went wrong" — don't route
/// both through AppErrorWidget. An empty cart, an empty inbox, a
/// filtered list with no matches: this is the widget for that.
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final Widget? action;

  const EmptyStateWidget({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 20),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
