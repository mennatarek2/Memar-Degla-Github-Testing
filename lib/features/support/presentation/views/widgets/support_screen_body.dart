import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/contact_card.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/contact_form.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/frequetly_asked_questions_list.dart';
import 'package:memar_degla/features/support/presentation/views/widgets/reach_us.dart';

class SupportScreenBody extends StatelessWidget {
  const SupportScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddings.horizontalPadding,
        vertical: AppPaddings.verticalPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReachUs(
                        title: "WhatsApp",
                        subTitle: "Quick Responses",
                        icon: FontAwesomeIcons.whatsapp,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ReachUs(
                        title: "Call Us",
                        subTitle: "Available 24/7",
                        icon: FontAwesomeIcons.phone,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverToBoxAdapter(child: FrequetlyAskedQuestionsList()),

          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                ContactForm(),
                SizedBox(height: 20),
                ContactCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
