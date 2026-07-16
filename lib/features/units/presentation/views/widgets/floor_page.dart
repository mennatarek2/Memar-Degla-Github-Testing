import 'package:flutter/material.dart';
import 'package:memar_degla/core/constants/app_padddings.dart';
import 'package:memar_degla/core/styles/containers_style.dart';

class FloorPlanPage extends StatelessWidget {
  const FloorPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ContainersStyle.profileItemContainer(context),
      padding: const EdgeInsets.all(AppPaddings.containerPadding),
      child: const Column(children: [Text("Floor Plan Placeholder")]),
    );
  }
}
