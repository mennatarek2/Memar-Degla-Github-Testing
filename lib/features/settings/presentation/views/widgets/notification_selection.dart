
import 'package:easy_localization/easy_localization.dart';
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
          title: 'settings.notifications'.tr(),
          children: [
            RadioSettingTile(
              title: 'settings.push_notifications'.tr(),
              subtitle: 'settings.receive_push_notifications'.tr(),
              trailingIcon: Icons.notifications_rounded,
              selected: state.pushEnabled,
              backgroundColor: colors.navy,
              contentColor: colors.primaryGold,
              radioActiveColor: colors.primaryGold,
              onTap: () => context.read<NotificationsCubit>().togglePush(),
            ),
            RadioSettingTile(
              title: 'settings.email_notifications'.tr(),
              subtitle: 'settings.receive_email_notifications'.tr(),
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
