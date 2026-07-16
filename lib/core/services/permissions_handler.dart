import 'package:permission_handler/permission_handler.dart';

/// Result of a permission check/request, kept simple so the UI layer
/// can react without knowing anything about permission_handler's types.
enum AppPermissionStatus { granted, denied, permanentlyDenied, restricted }

/// Single-responsibility wrapper around permission_handler.
/// Callers never talk to `Permission` directly — they go through this.
class PermissionService {
  PermissionService._();
  static final PermissionService instance = PermissionService._();

  Future<AppPermissionStatus> checkStatus(Permission permission) async {
    final status = await permission.status;
    return _map(status);
  }

  /// Requests the permission if not already granted.
  /// Returns the resulting status — check for `permanentlyDenied`
  /// so the UI can prompt the user to open app settings.
  Future<AppPermissionStatus> request(Permission permission) async {
    final current = await permission.status;
    if (current.isGranted) return AppPermissionStatus.granted;

    final result = await permission.request();
    return _map(result);
  }

  /// Requests multiple permissions at once (e.g. camera + microphone).
  Future<Map<Permission, AppPermissionStatus>> requestMultiple(
    List<Permission> permissions,
  ) async {
    final results = await permissions.request();
    return results.map((key, value) => MapEntry(key, _map(value)));
  }

  Future<bool> openSettings() => openAppSettings();

  AppPermissionStatus _map(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return AppPermissionStatus.granted;
      case PermissionStatus.permanentlyDenied:
        return AppPermissionStatus.permanentlyDenied;
      case PermissionStatus.restricted:
        return AppPermissionStatus.restricted;
      case PermissionStatus.denied:
      case PermissionStatus.provisional:
        return AppPermissionStatus.denied;
    }
  }
}
