import 'package:memar_degla/features/profile/domain/repo/profile_repo.dart';

class SaveProfilePictureUseCase {
  const SaveProfilePictureUseCase(this._repository);

  final ProfilePictureRepository _repository;

  Future<void> call(String path) {
    return _repository.saveProfilePicturePath(path);
  }
}
