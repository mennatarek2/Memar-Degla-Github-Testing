// domain/entities/user_profile.dart — pure Dart, no Flutter/Dio imports
class UserProfile {
  final String email;
  final String name;
  final String phone;
  final String code;
  const UserProfile({
    required this.email,
    required this.name,
    required this.phone,
    required this.code,
  });
}
