import 'package:flutter/material.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/apperance_selection.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/language_selection.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/notification_selection.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LanguageSection(),
          SizedBox(height: 20),
          AppearanceSection(),
          SizedBox(height: 20),
          NotificationsSection(),
        ],
      ),
    );
  }
}
