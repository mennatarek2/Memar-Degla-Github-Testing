import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/features/profile/domain/useCases/clear_saved_picture_use_case.dart';
import 'package:memar_degla/features/profile/domain/useCases/get_saved_profile_picture_use_case.dart';
import 'package:memar_degla/features/profile/domain/useCases/save_profile_picture_use_case.dart';
import 'package:memar_degla/features/profile/presentation/manger/cubit/profile_picture_state.dart';

/// Orchestrates loading/saving/clearing the profile picture.
///
/// Deliberately knows nothing about `image_picker` or file-choosing UI —
/// the widget is responsible for opening the picker sheet and getting a
/// File; this Cubit only takes the resulting *path* and persists it.
/// That keeps this class testable with plain fakes of the three use
/// cases, with no platform channels or UI involved.
class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit({
    required this._saveProfilePicture,
    required this._getSavedProfilePicture,
    required this._clearProfilePicture,
  }) : super(const ProfilePictureState());

  final SaveProfilePictureUseCase _saveProfilePicture;
  final GetSavedProfilePictureUseCase _getSavedProfilePicture;
  final ClearProfilePictureUseCase _clearProfilePicture;

  /// Call once when the app bar / card first mounts, to restore
  /// whatever was picked in a previous session.
  Future<void> loadSavedImage() async {
    emit(state.copyWith(status: ProfilePictureStatus.loading));
    try {
      final path = await _getSavedProfilePicture();
      emit(
        state.copyWith(status: ProfilePictureStatus.loaded, imagePath: path),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfilePictureStatus.error,
          errorMessage: 'Could not load saved profile picture.',
        ),
      );
    }
  }

  /// Call after the widget's image picker returns a file. Takes a path
  /// rather than a File so this Cubit stays free of any dart:io/File
  /// coupling beyond what the state class already needs for display.
  Future<void> selectImage(String path) async {
    final previousState = state;
    // Optimistic update — the picked image shows immediately; if the
    // save fails, we roll back rather than leaving the UI stuck on an
    // image that didn't actually persist.
    emit(state.copyWith(status: ProfilePictureStatus.loaded, imagePath: path));
    try {
      await _saveProfilePicture(path);
    } catch (e) {
      emit(
        previousState.copyWith(
          status: ProfilePictureStatus.error,
          errorMessage: 'Could not save profile picture.',
        ),
      );
    }
  }

  Future<void> removeImage() async {
    try {
      await _clearProfilePicture();
      emit(const ProfilePictureState(status: ProfilePictureStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfilePictureStatus.error,
          errorMessage: 'Could not remove profile picture.',
        ),
      );
    }
  }
}
