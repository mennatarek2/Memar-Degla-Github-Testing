import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

/// One reusable row: [radio] [title + subtitle] [trailing icon].
///
/// Used for both:
///  - Appearance section → Light Mode / Dark Mode (light card, navy content)
///  - Notifications section → Push / Email (navy card, gold content)
///
/// Only colors change between the two — the structure and the radio
/// animation are identical, which is the whole point of sharing it.
class RadioSettingTile extends StatelessWidget {
  const RadioSettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.selected,
    required this.backgroundColor,
    required this.contentColor,
    required this.radioActiveColor,
    required this.onTap,
    this.borderColor,
    this.margin,
  });

  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final bool selected;
  final Color backgroundColor;
  final Color contentColor;
  final Color radioActiveColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 1)
                : null,
          ),
          child: Row(
            children: [
              _RadioDot(selected: selected, activeColor: radioActiveColor),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: contentColor),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: contentColor.withValues(alpha: 0.7)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(trailingIcon, color: contentColor, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  const _RadioDot({required this.selected, required this.activeColor});

  final bool selected;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: activeColor.withValues(alpha: selected ? 1 : 0.5),
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        scale: selected ? 1 : 0,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: activeColor, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
