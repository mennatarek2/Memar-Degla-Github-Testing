import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/language_option_tile.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/settings_section_card.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    // easy_localization already owns locale state + persistence (see the
    // EasyLocalization(saveLocale: true, ...) wrapper in main.dart) —
    // context.locale updates MaterialApp.router directly, no cubit needed.
    final currentCode = context.locale.languageCode;

    return SettingsSectionCard(
      title: 'Language',
      children: [
        LanguageOptionTile(
          label: 'English',
          selected: currentCode == 'en',
          onTap: () => context.setLocale(const Locale('en')),
        ),
        LanguageOptionTile(
          label: 'العربية',
          selected: currentCode == 'ar',
          onTap: () => context.setLocale(const Locale('ar')),
        ),
      ],
    );
  }
}
