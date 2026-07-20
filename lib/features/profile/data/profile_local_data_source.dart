import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfilePictureLocalDataSource {
  Future<void> savePath(String path);
  String? getPath();
  Future<void> clearPath();
}

class ProfilePictureLocalDataSourceImpl
    implements ProfilePictureLocalDataSource {
  const ProfilePictureLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  static const String _profilePictureKey = 'profile_picture_path';

  @override
  Future<void> savePath(String path) async {
    await _prefs.setString(_profilePictureKey, path);
  }

  @override
  String? getPath() {
    return _prefs.getString(_profilePictureKey);
  }

  @override
  Future<void> clearPath() async {
    await _prefs.remove(_profilePictureKey);
  }
}
