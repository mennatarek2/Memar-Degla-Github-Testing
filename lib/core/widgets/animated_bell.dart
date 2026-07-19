import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class AnimatedBell extends StatefulWidget {
  const AnimatedBell({super.key, required this.trigger});
  final bool trigger;
  @override
  State<AnimatedBell> createState() => _AnimatedBellState();
}

class _AnimatedBellState extends State<AnimatedBell>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _angle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _angle = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.12), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.12, end: -0.10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.10, end: 0.05), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.0), weight: 1),
    ]).animate(_controller);
    _controller.repeat(period: const Duration(seconds: 2));
  }

  @override
  void didUpdateWidget(covariant AnimatedBell old) {
    super.didUpdateWidget(old);
    if (widget.trigger && !old.trigger) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AnimatedBuilder(
        animation: _angle,
        builder: (context, child) =>
            Transform.rotate(angle: _angle.value, child: child),
        child: Icon(
          Icons.notifications,
          color: context.colors.navActive,
          size: 30,
        ),
      ),
    );
  }
}
