import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({
    super.key,
    required this.icon,
    required this.documentType,
    required this.details,
    required this.type,
    this.onPressed,
  });
  final IconData icon;
  final String documentType, details, type;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: ContainersStyle.profileItemIconContainer(context),
          padding: const EdgeInsets.all(AppPaddings.containerPadding),
          child: Icon(icon),
        ),

        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                "$documentType - $details",
                style: AppStyles.styleSemiBold20(context),
              ),
              Text(
                type,
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: context.colors.navActive),
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.file_download_outlined),
        ),
      ],
    );
  }
}
