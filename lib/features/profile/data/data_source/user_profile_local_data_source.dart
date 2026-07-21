import 'package:memar_degla/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserProfileLocalDataSource {
  Future<void> saveUserEmail({required String email});
  Future<void> saveUserPhoneNumber({required String phoneNumber});
  Future<void> saveUserCode({required String userCode});
  Future<void> saveUserFullName({required String userFullName});
  Future<String> getUserEmail();
  Future<String> getUserPhoneNumber();
  Future<String> getUserCode();
  Future<String> getUserFullname();
}

class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  final SharedPreferences _prefs;

  static const String _profilePictureKey = 'profile_picture_path';

  UserProfileLocalDataSourceImpl(this._prefs);
  @override
  Future<String> getUserCode() async {
    return _prefs.getString(AppConstants.kUserCodeKey)!;
  }

  @override
  Future<String> getUserEmail() async {
    return _prefs.getString(AppConstants.kUserEmailKey)!;
  }

  @override
  Future<String> getUserFullname() async {
    return _prefs.getString(AppConstants.kUserNameKey)!;
  }

  @override
  Future<String> getUserPhoneNumber() async {
    return _prefs.getString(AppConstants.kUserPhoneNumberKey)!;
  }

  @override
  Future<void> saveUserCode({required String userCode}) async {
    _prefs.setString(AppConstants.kUserCodeKey, userCode);
  }

  @override
  Future<void> saveUserEmail({required String email}) async {
    _prefs.setString(AppConstants.kUserEmailKey, email);
  }

  @override
  Future<void> saveUserFullName({required String userFullName}) async {
    _prefs.setString(AppConstants.kUserNameKey, userFullName);
  }

  @override
  Future<void> saveUserPhoneNumber({required String phoneNumber}) async {
    _prefs.setString(AppConstants.kUserPhoneNumberKey, phoneNumber);
  }

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
