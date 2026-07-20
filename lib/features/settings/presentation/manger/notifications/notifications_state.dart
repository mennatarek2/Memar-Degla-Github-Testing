import 'package:equatable/equatable.dart';
import 'package:memar_degla/features/settings/domain/entities/notification_channel.dart';

class SettingsNotificationsState extends Equatable {
  const SettingsNotificationsState({
    required this.pushEnabled,
    required this.emailEnabled,
    this.isLoading = false,
    this.permissionDeniedFor,
  });

  const SettingsNotificationsState.initial()
    : pushEnabled = false,
      emailEnabled = false,
      isLoading = true,
      permissionDeniedFor = null;

  final bool pushEnabled;
  final bool emailEnabled;
  final bool isLoading;

  /// Set for exactly one emission right after the OS denies the push
  /// permission, so a [BlocListener] can show a message once. The cubit
  /// clears it back to null immediately after emitting it.
  final NotificationChannel? permissionDeniedFor;

  SettingsNotificationsState copyWith({
    bool? pushEnabled,
    bool? emailEnabled,
    bool? isLoading,
    NotificationChannel? permissionDeniedFor,
  }) {
    return SettingsNotificationsState(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      emailEnabled: emailEnabled ?? this.emailEnabled,
      isLoading: isLoading ?? this.isLoading,
      permissionDeniedFor: permissionDeniedFor,
    );
  }

  @override
  List<Object?> get props => [
    pushEnabled,
    emailEnabled,
    isLoading,
    permissionDeniedFor,
  ];
}
