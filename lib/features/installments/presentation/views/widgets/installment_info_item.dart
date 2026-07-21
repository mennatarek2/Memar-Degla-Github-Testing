import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/containers_style.dart';

import 'package:memar_degla/core/themes/theme_extention.dart';

class InstallmentInfoItem extends StatelessWidget {
  const InstallmentInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: ContainersStyle.profileItemContainer(context),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: ContainersStyle.profileItemIconContainer(context),
            child: Icon(icon, color: context.colors.primaryGold, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
