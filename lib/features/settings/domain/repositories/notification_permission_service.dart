/// Abstraction over the OS notification permission.
///
/// Kept in the domain layer as a pure interface (no plugin imports here)
/// so use cases can depend on it without knowing that `permission_handler`
/// exists. The data layer provides the real implementation.
abstract class NotificationPermissionService {
  /// True if the OS permission is currently granted.
  Future<bool> isGranted();

  /// Shows the OS permission prompt (no-op if already granted/denied
  /// permanently). Returns true only if the user grants it.
  Future<bool> request();
}
