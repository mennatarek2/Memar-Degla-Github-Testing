import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarLocalDataSource {
  static const _avatarFileName = 'profile_avatar.jpg';
  static const _avatarPathKey = 'avatarPath';

  Future<String> saveAvatarImage(XFile pickedImage) async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedPath = '${appDir.path}/$_avatarFileName';

    final oldFile = File(savedPath);
    if (await oldFile.exists()) {
      await oldFile.delete();
    }

    final newFile = await File(pickedImage.path).copy(savedPath);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_avatarPathKey, newFile.path);

    return newFile.path;
  }

  Future<String?> getSavedAvatarPath() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_avatarPathKey);

    if (path != null && await File(path).exists()) {
      return path;
    }
    return null;
  }

  Future<void> clearAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_avatarPathKey);
    if (path != null) {
      final file = File(path);
      if (await file.exists()) await file.delete();
    }
    await prefs.remove(_avatarPathKey);
  }
}
