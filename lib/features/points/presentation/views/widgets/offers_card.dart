import 'package:easy_localization/easy_localization.dart';
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

    final pillBorder = Border.all(
      color: Colors.white.withValues(alpha: 0.35),
      width: 1,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.containerPadding,
        vertical: 24,
      ),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: pillBorder,
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),

              const SizedBox(width: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: pillBorder,
                ),
                child: Text(
                  offerType.toUpperCase(),
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Colors.white, letterSpacing: 0.5),
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: pillBorder,
                ),
                child: Text(
                  offersBenfits,
                  style: AppStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Text(
            title,
            style: AppStyles.styleBold24(context).copyWith(color: Colors.white),
          ),

          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'points.limited_time_offer'.tr(),
                          style: AppStyles.styleSemiBold16(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          endDate,
                          style: AppStyles.styleMedium13(context).copyWith(
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  'units.details'.tr(),
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
