import 'package:flutter/widgets.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CounterText extends StatefulWidget {
  const CounterText({super.key, required this.targetValue});
  final int targetValue;
  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<int> _count;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _count = IntTween(
      begin: 0,
      end: widget.targetValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Formats 12450 -> "12,450" without pulling in intl just for this.
  String _formatWithCommas(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      final posFromEnd = digits.length - i;
      buffer.write(digits[i]);
      if (posFromEnd > 1 && posFromEnd % 3 == 1) {
        buffer.write(',');
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppStyles.styleBold50(context).copyWith(
      fontSize: 60,
      color: context.colors.primaryGold,
      shadows: [
        Shadow(
          offset: const Offset(0, 4),
          blurRadius: 10,
          color: context.colors.onPrimaryGold,
        ),
      ],
    );

    return SlideTransition(
      position: _slide,
      child: AnimatedBuilder(
        animation: _count,
        builder: (context, _) {
          final text = _formatWithCommas(_count.value);
          return Stack(
            children: [
              // Dark embossed outline underneath, gives the beveled edge.
              Text(
                text,
                style: baseStyle.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = const Color(0xFF3D2A0F),
                ),
              ),
              // Gold gradient fill on top.
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFF3C4),
                    Color(0xFFF0C24B),
                    Color(0xFFC8862B),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ).createShader(bounds),
                child: Text(text, style: baseStyle),
              ),
            ],
          );
        },
      ),
    );
  }
}
