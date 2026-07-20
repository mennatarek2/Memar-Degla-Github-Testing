// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:memar_degla/core/styles/text_styles.dart';
// import 'package:memar_degla/core/themes/theme_extention.dart';
// import 'package:memar_degla/core/widgets/animated_bell.dart';
// import 'package:memar_degla/features/profile/presentation/widgets/profile_picture_card.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key, this.title, this.onNotificationPressed});

//   final String? title;
//   final VoidCallback? onNotificationPressed;
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     final canPop = context.canPop();

//     return AppBar(
//       elevation: 0,
//       scrolledUnderElevation: 0,
//       surfaceTintColor: Colors.transparent,
//       leading: canPop
//           ? IconButton(
//               onPressed: () => context.pop(),
//               icon: const Icon(Icons.arrow_back_ios),
//             )
//           : const ProfilePictureCircularCard(),
//       actions: [
//         GestureDetector(
//           onTap: onNotificationPressed,
//           child: const AnimatedBell(trigger: true),
//         ),
//       ],
//       centerTitle: true,
//       title: Text(
//         title ?? '',
//         style: AppStyles.styleSemiBold24(
//           context,
//         ).copyWith(color: context.colors.shadow),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/core/widgets/animated_bell.dart';
import 'package:memar_degla/features/profile/presentation/views/widgets/profile_picture_card.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.onNotificationPressed});

  final String? title;
  final VoidCallback? onNotificationPressed;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      animateColor: true,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: const Row(
        children: [SizedBox(width: 10), ProfilePictureCircularCard()],
      ),
      actions: [
        GestureDetector(
          onTap: onNotificationPressed,
          child: const AnimatedBell(trigger: true),
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
