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

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: AnimatedBuilder(
        animation: _count,
        builder: (context, _) => Text(
          '${_count.value}',
          style: AppStyles.styleSemiBold56(context).copyWith(
            color: context.colors.navActive,
            shadows: [
              const Shadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: Color(0xFF422C0D),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
