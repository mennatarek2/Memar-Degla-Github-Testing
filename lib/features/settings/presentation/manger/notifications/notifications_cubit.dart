import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/features/settings/domain/entities/notification_channel.dart';
import 'package:memar_degla/features/settings/domain/usecases/get_notification_preferences.dart';
import 'package:memar_degla/features/settings/domain/usecases/set_notification_channel_enabled.dart';
import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_state.dart';

class NotificationsCubit extends Cubit<SettingsNotificationsState> {
  NotificationsCubit(this._getPreferences, this._setChannelEnabled)
    : super(const SettingsNotificationsState.initial()) {
    _load();
  }

  final GetNotificationPreferences _getPreferences;
  final SetNotificationChannelEnabled _setChannelEnabled;

  Future<void> _load() async {
    final prefs = await _getPreferences();
    emit(
      state.copyWith(
        pushEnabled: prefs.pushEnabled,
        emailEnabled: prefs.emailEnabled,
        isLoading: false,
      ),
    );
  }

  Future<void> togglePush() => _toggle(NotificationChannel.push);
  Future<void> toggleEmail() => _toggle(NotificationChannel.email);

  Future<void> _toggle(NotificationChannel channel) async {
    final currentlyEnabled = channel == NotificationChannel.push
        ? state.pushEnabled
        : state.emailEnabled;
    final targetEnabled = !currentlyEnabled;

    final result = await _setChannelEnabled(
      channel: channel,
      enabled: targetEnabled,
    );

    emit(
      state.copyWith(
        pushEnabled: channel == NotificationChannel.push
            ? result.enabled
            : null,
        emailEnabled: channel == NotificationChannel.email
            ? result.enabled
            : null,
        permissionDeniedFor: result.permissionDenied ? channel : null,
      ),
    );

    // Clear the one-shot flag right after emitting it so a second listener
    // rebuild (or hot reload) doesn't replay the same denial message.
    if (result.permissionDenied) {
      emit(state.copyWith(permissionDeniedFor: null));
    }
  }
}
