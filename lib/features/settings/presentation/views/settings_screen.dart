import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/features/settings/domain/entities/notification_channel.dart';
import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_cubit.dart';
import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_state.dart';
import 'package:memar_degla/features/settings/presentation/views/widgets/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: SettingsBlocManger(),
    );
  }
}

class SettingsBlocManger extends StatelessWidget {
  const SettingsBlocManger({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, SettingsNotificationsState>(
      listenWhen: (previous, current) => current.permissionDeniedFor != null,
      listener: (context, state) {
        final channel = state.permissionDeniedFor;
        if (channel == NotificationChannel.push) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Notification permission was denied. '
                'Enable it from your device settings to turn this on.',
              ),
            ),
          );
        }
      },
      child: const SettingsScreenBody(),
    );
  }
}
