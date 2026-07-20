import 'package:memar_degla/features/profile/domain/repo/profile_repo.dart';

class GetSavedProfilePictureUseCase {
  const GetSavedProfilePictureUseCase(this._repository);

  final ProfilePictureRepository _repository;

  Future<String?> call() {
    return _repository.getProfilePicturePath();
  }
}
