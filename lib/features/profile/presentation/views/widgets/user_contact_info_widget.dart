import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class UserContactInfoWidget extends StatelessWidget {
  final String email;
  final String phone;

  const UserContactInfoWidget({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: Column(
        children: [
          // Email
          Row(
            children: [
              // Email icon container
              Container(
                decoration: ContainersStyle.profileItemIconContainer(context),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.email_outlined,
                  color: context.colors.icon,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Email info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email,
                      style: AppStyles.styleBold16(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 1, color: context.colors.iconBackGround),

          // const SizedBox(height: 16),
          // Phone
          Row(
            children: [
              // Phone icon container
              Container(
                decoration: ContainersStyle.profileItemIconContainer(context),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.phone_outlined,
                  color: context.colors.icon,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Phone info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phone,
                      style: AppStyles.styleBold18(
                        context,
                      ).copyWith(color: context.colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
