import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class ResponseSuccessCustomized extends StatefulWidget {
  final String message;
  final String imagePath; // Pass your asset image path here
  final Duration displayDuration;
  final VoidCallback? onDismissed;

  const ResponseSuccessCustomized({
    super.key,
    required this.message,
    required this.imagePath,
    this.displayDuration = const Duration(seconds: 3),
    this.onDismissed,
  });

  static void show(
    BuildContext context, {
    required String message,
    required String imagePath,
    Duration displayDuration = const Duration(seconds: 3),
    VoidCallback? onDismissed,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => ResponseSuccessCustomized(
        message: message,
        imagePath: imagePath,
        displayDuration: displayDuration,
        onDismissed: () {
          entry.remove();
          onDismissed?.call();
        },
      ),
    );

    overlay.insert(entry);
  }

  @override
  State<ResponseSuccessCustomized> createState() =>
      _ResponseSuccessCustomizedState();
}

class _ResponseSuccessCustomizedState extends State<ResponseSuccessCustomized>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Animate in
    _controller.forward();

    Future.delayed(widget.displayDuration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) widget.onDismissed?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: ScaleTransition(
            scale: _scaleAnim,
            child: Container(
              width: 260,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
              decoration: BoxDecoration(
                color: context.colors.inputBackground,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image with green circle border
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF34C759),
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Message text
                  Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: context.colors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// USAGE EXAMPLE
// ─────────────────────────────────────────────

// 1. Add your image to pubspec.yaml:
//    flutter:
//      assets:
//        - assets/success_icon.png

// 2. Call from any button/action:
//
// ElevatedButton(
//   onPressed: () {
//     ResponseSuccessCustomized.show(
//       context,
//       message: 'Identity verified successfully',
//       imagePath: 'assets/success_icon.png',
//       displayDuration: Duration(seconds: 3),
//     );
//   },
//   child: Text('Verify'),
// )
