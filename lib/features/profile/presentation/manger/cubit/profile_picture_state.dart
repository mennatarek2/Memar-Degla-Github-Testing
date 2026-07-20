import 'dart:io';

enum ProfilePictureStatus { initial, loading, loaded, error }

/// A single state class with a status enum, rather than a sealed
/// hierarchy of state classes — this Cubit only ever carries one piece
/// of data (an optional image path) through a small number of statuses,
/// so a status enum keeps BlocBuilder call sites simple
/// (`state.status == ProfilePictureStatus.loaded`) without the
/// boilerplate of a full sealed-class state machine for something this
/// small. Swap to sealed classes if this state ever grows more shapes.
class ProfilePictureState {
  const ProfilePictureState({
    this.status = ProfilePictureStatus.initial,
    this.imagePath,
    this.errorMessage,
  });

  final ProfilePictureStatus status;
  final String? imagePath;
  final String? errorMessage;

  /// Convenience getter — the widget layer wants a File, the state
  /// layer stores a path (paths are what actually gets persisted).
  File? get imageFile => imagePath != null ? File(imagePath!) : null;

  ProfilePictureState copyWith({
    ProfilePictureStatus? status,
    String? imagePath,
    String? errorMessage,
  }) {
    return ProfilePictureState(
      status: status ?? this.status,
      imagePath: imagePath ?? this.imagePath,
      errorMessage: errorMessage,
    );
  }
}
