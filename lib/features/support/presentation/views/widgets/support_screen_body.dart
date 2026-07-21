import 'package:easy_localization/easy_localization.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(
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
                        title: 'support.whatsapp'.tr(),
                        subTitle: 'support.quick_responses'.tr(),
                        icon: FontAwesomeIcons.whatsapp,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ReachUs(
                        title: 'support.call_us'.tr(),
                        subTitle: 'support.available_24_7'.tr(),
                        icon: FontAwesomeIcons.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: FrequetlyAskedQuestionsList()),

          const SliverToBoxAdapter(
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
