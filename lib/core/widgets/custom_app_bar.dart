import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.onNotificationPressed});

  final String? title;
  final VoidCallback? onNotificationPressed;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();

    return AppBar(
      leading: canPop
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios),
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(
            shadows: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],

            Icons.notifications,
            color: context.colors.primaryGold,
          ),
          onPressed: onNotificationPressed,
        ),
      ],
      centerTitle: true,
      title: Text(
        title ?? '',
        style: AppStyles.styleSemiBold24(
          context,
        ).copyWith(color: context.colors.shadow),
      ),
    );
  }
}
