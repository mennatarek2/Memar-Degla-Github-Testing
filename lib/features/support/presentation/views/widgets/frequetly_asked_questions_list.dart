import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/features/support/data/models/frequetly_asked_questions_model.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/frequently_asked_questions.dart';

class FrequetlyAskedQuestionsList extends StatelessWidget {
  const FrequetlyAskedQuestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Frequently Asked Questions",
            style: AppStyles.styleSemiBold24(context),
          ),
          const SizedBox(height: 20),
          Column(
            children: questionsAndAnswerModel
                .map(
                  (items) => FrequentlyAskedQuestions(
                    title: items.titleQuestion,
                    steps: items.steps,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
