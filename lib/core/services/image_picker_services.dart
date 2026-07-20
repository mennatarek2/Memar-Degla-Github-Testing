import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  /// Picks a single image from [source]. Returns null if the user
  /// cancels the picker — this is a normal outcome, not an error, so
  /// callers should treat null as "no change" rather than a failure.
  Future<File?> pickImage({
    required ImageSource source,
    int imageQuality = 80,
  }) async {
    final XFile? picked = await _picker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (picked == null) return null;
    return File(picked.path);
  }

  Future<File?> pickFromGallery({int imageQuality = 80}) {
    return pickImage(source: ImageSource.gallery, imageQuality: imageQuality);
  }

  Future<File?> pickFromCamera({int imageQuality = 80}) {
    return pickImage(source: ImageSource.camera, imageQuality: imageQuality);
  }

  Future<File?> showImageSourceSheet(BuildContext context) async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Choose from gallery'),
                onTap: () =>
                    Navigator.of(sheetContext).pop(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Take a photo'),
                onTap: () => Navigator.of(sheetContext).pop(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );

    if (source == null) return null;
    // context is still valid here as long as this is awaited without a
    // route change in between — safe for the typical "tap avatar" flow.
    return pickImage(source: source);
  }
}
