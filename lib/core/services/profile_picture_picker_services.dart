import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickAvatarImage() async {
  try {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024,
    );
    return image;
  } on PlatformException catch (e) {
    // e.code == 'photo_access_denied' is the common one to handle
    debugPrint('Image picker error: ${e.code} - ${e.message}');
    return null;
  }
}
