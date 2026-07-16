import 'package:flutter/material.dart';
import 'package:memar_degla/features/home/data/models/quick_actions_model.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/quick_actions_items.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: quickActionsModel.length,

      itemBuilder: (context, index) {
        final quickActionItem = quickActionsModel[index];
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: QuickActionsItems(model: quickActionItem),
        );
      },
    );
  }
}
