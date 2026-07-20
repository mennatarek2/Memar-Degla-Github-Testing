import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/home/data/models/quick_actions_model.dart';

class QuickActionsItems extends StatelessWidget {
  const QuickActionsItems({super.key, required this.model});
  final QuickActionsModel model;

  @override
  Widget build(BuildContext context) {
    debugPrint(model.imagePath);
    final colors = context.colors;
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(model.navigationPath),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: colors.containerBackground,
            radius: 30,
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: model.imageColor.withValues(alpha: 0.3),
                shape: CircleBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: model.imageColor.withValues(alpha: 0.7),
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(
                    model.imagePath,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint('SVG failed to load: $error');
                      return const Icon(
                        Icons.broken_image,
                      ); // fallback so app doesn't crash
                    },
                    // colorFilter: ColorFilter.mode(model.imageColor, BlendMode.clear),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.actionTitle,
            style: AppStyles.styleBold16(context).copyWith(),
          ),
        ],
      ),
    );
  }
}
