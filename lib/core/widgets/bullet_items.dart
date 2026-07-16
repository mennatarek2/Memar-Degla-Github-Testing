import 'package:flutter/material.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class BulletItem extends StatelessWidget {
  const BulletItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // key part
        children: [
          CircleAvatar(
            minRadius: 7,
            maxRadius: 10,
            backgroundColor: context.colors.offerGreen,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
              // no maxLines / no overflow -> wraps to as many lines as needed
            ),
          ),
        ],
      ),
    );
  }
}
