import 'package:permission_handler/permission_handler.dart';
import 'package:memar_degla/features/settings/domain/repositories/notification_permission_service.dart';

class NotificationPermissionServiceImpl
    implements NotificationPermissionService {
  const NotificationPermissionServiceImpl();

  @override
  Future<bool> isGranted() async {
    return Permission.notification.status.then((s) => s.isGranted);
  }

  @override
  Future<bool> request() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }
}
