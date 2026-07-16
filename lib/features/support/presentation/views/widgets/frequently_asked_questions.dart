import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({
    super.key,
    required this.title,
    required this.steps,
  });
  final String title, steps;

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 10),
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(AppPaddings.containerPadding),
          decoration: ContainersStyle.frequentlyAskedQuestions(context),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                isShown = !isShown;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: AppStyles.styleSemiBold24(context),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isShown ? 0.25 : 0, // 90 degrees when open
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: isShown
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.steps,
                            style: AppStyles.styleMedium16(
                              context,
                            ).copyWith(color: context.colors.textSecondary),
                          ),
                        )
                      : const SizedBox(width: double.infinity, height: 0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
