import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/custom_loading_auth_button.dart';
import 'package:memar_degla/features/authentication/presentation/views/widgets/email_text_field.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/customized_text_field.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'support.contact_form'.tr(),
            style: AppStyles.styleSemiBold24(context),
          ),
          const SizedBox(height: 20),
          CustomizedTextField(label: 'support.enter_your_name'.tr()),
          const SizedBox(height: 10),
          EmailTextField(label: 'support.email'.tr()),
          const SizedBox(height: 20),
          CustomizedTextField(label: 'support.how_can_we_help'.tr()),
          const SizedBox(height: 20),
          CustomLoadingAuthButton(title: 'support.send_message'.tr()),
        ],
      ),
    );
  }
}
