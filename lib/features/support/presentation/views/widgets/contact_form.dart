import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
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
          Text("Contact Form", style: AppStyles.styleSemiBold24(context)),
          const SizedBox(height: 20),
          const CustomizedTextField(label: "Enter your name"),
          const SizedBox(height: 10),
          const EmailTextField(label: "Email"),
          const SizedBox(height: 20),
          const CustomizedTextField(label: "How can we help?"),
          const SizedBox(height: 20),
          const CustomLoadingAuthButton(title: "Send Message"),
        ],
      ),
    );
  }
}
