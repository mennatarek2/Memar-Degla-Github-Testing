import 'package:flutter/material.dart';
import '../../error/failures.dart';
import '../../presentation/failure_ui_mapper.dart';

/// Drop-in replacement for "just show the error" anywhere a Bloc/Cubit
/// emits an error state. One widget, reused everywhere:
///
/// ```dart
/// BlocBuilder<ProfileCubit, ProfileState>(
///   builder: (context, state) => switch (state) {
///     ProfileError(:final failure) => AppErrorWidget(
///         failure: failure,
///         onRetry: () => context.read<ProfileCubit>().load(),
///       ),
///     _ => ...
///   },
/// )
/// ```
class AppErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const AppErrorWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final ui = failure.toUiModel();
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(ui.icon, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              ui.title,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              ui.message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (ui.canRetry && onRetry != null) ...[
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onRetry,
                child: const Text('Try again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
