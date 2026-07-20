import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_cubit.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_state.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/radio_settings_tile.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/settings_section_card.dart';

class AppearanceSection extends StatelessWidget {
  const AppearanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<ThemeCubit, SettingsThemeState>(
      builder: (context, state) {
        return SettingsSectionCard(
          title: 'Appearance',
          children: [
            RadioSettingTile(
              title: 'Light Mode',
              subtitle: 'Switch to light theme',
              trailingIcon: Icons.wb_sunny_rounded,
              selected: state.mode == AppThemeMode.light,
              backgroundColor: colors.surface,
              contentColor: colors.textPrimary,
              radioActiveColor: colors.textPrimary,
              borderColor: colors.textFieldBorder,
              onTap: () =>
                  context.read<ThemeCubit>().selectMode(AppThemeMode.light),
            ),
            RadioSettingTile(
              title: 'Dark Mode',
              subtitle: 'Switch to dark theme',
              trailingIcon: Icons.nightlight_round,
              selected: state.mode == AppThemeMode.dark,
              backgroundColor: colors.surface,
              contentColor: colors.textPrimary,
              radioActiveColor: colors.textPrimary,
              borderColor: colors.textFieldBorder,
              margin: EdgeInsets.zero,
              onTap: () {
                context.read<ThemeCubit>().selectMode(AppThemeMode.dark);
                print(
                  'AppearanceSection sees: ${context.read<ThemeCubit>().hashCode}',
                );
              },
            ),
          ],
        );
      },
    );
  }
}
