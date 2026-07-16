import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      decoration: ContainersStyle.profileItemContainer(context),
      child: Row(
        children: [
          Container(
            decoration: ContainersStyle.profileItemIconContainer(context),
            padding: const EdgeInsets.all(AppPaddings.containerPadding),
            child: Icon(Icons.email_outlined, color: colors.navActive),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Support",
                style: AppStyles.styleMedium18(
                  context,
                ).copyWith(color: colors.textSecondary),
              ),

              Text(
                "Support@memaardegla.com",
                style: AppStyles.styleSemiBold20(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
