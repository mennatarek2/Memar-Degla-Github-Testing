import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class SectionSelector extends StatefulWidget {
  final PageController controller;

  const SectionSelector({super.key, required this.controller});

  @override
  State<SectionSelector> createState() => _SectionSelectorState();
}

class _SectionSelectorState extends State<SectionSelector> {
  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.controller.animateTo(
      index.toDouble(),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: Row(
        children: [
          Container(
            width: double.infinity,
            decoration: ContainersStyle.profileItemContainer(
              context,
            ).copyWith(color: context.colors.surfaceVariant),
            child: TextButton(
              onPressed: () => _selectPage(0),
              child: Text(
                "Details",
                style: AppStyles.styleBold16(context).copyWith(
                  color: selectedIndex == 0
                      ? context.colors.textPrimary
                      : context.colors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Container(
            width: double.infinity,
            decoration: ContainersStyle.profileItemContainer(
              context,
            ).copyWith(color: context.colors.surfaceVariant),
            child: TextButton(
              onPressed: () => _selectPage(1),
              child: Text(
                "Floor Plan",
                style: AppStyles.styleBold16(context).copyWith(
                  color: selectedIndex == 1
                      ? context.colors.textPrimary
                      : context.colors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
