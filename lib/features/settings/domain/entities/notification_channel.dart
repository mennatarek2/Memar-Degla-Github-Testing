/// Which notification channel a settings tile controls.
///
/// Only [push] is gated by the OS permission prompt — email delivery
/// doesn't need device-level permission.
enum NotificationChannel { push, email }
