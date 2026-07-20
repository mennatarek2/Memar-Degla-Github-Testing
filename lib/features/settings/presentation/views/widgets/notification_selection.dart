
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_cubit.dart';
import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_state.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/radio_settings_tile.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/settings_section_card.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<NotificationsCubit, SettingsNotificationsState>(
      builder: (context, state) {
        return SettingsSectionCard(
          title: 'Notifications',
          children: [
            RadioSettingTile(
              title: 'Push Notifications',
              subtitle: 'Receive push notifications',
              trailingIcon: Icons.notifications_rounded,
              selected: state.pushEnabled,
              backgroundColor: colors.navy,
              contentColor: colors.primaryGold,
              radioActiveColor: colors.primaryGold,
              onTap: () => context.read<NotificationsCubit>().togglePush(),
            ),
            RadioSettingTile(
              title: 'Email Notifications',
              subtitle: 'Receive email notifications',
              trailingIcon: Icons.mail_rounded,
              selected: state.emailEnabled,
              backgroundColor: colors.navy,
              contentColor: colors.primaryGold,
              radioActiveColor: colors.primaryGold,
              margin: EdgeInsets.zero,
              onTap: () => context.read<NotificationsCubit>().toggleEmail(),
            ),
          ],
        );
      },
    );
  }
}
