import 'package:flutter/material.dart';

import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/text_styles.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    required this.gradient,
    required this.icon,
    required this.offersBenfits,
    required this.offerType,
    required this.title,
    required this.endDate,
    required this.subtitle,
  });

  final LinearGradient gradient;
  final IconData icon;
  final String offersBenfits;
  final String offerType;
  final String title;
  final String endDate;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final shadowColor = gradient.colors.last;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(AppPaddings.containerPadding),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withValues(alpha: 0.28),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white),
                ),

                const SizedBox(width: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    offersBenfits,
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    offerType,
                    style: AppStyles.styleMedium13(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Text(
              title,
              style: AppStyles.styleSemiBold24(
                context,
              ).copyWith(color: Colors.white),
            ),

            const SizedBox(height: 8),

            Text(
              subtitle,
              style: AppStyles.styleMedium13(
                context,
              ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  color: Colors.white,
                  size: 20,
                ),

                const SizedBox(width: 6),

                Text(
                  endDate,
                  style: AppStyles.styleMedium13(
                    context,
                  ).copyWith(color: Colors.white),
                ),

                const Spacer(),

                Row(
                  children: [
                    Text(
                      "Details",
                      style: AppStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
