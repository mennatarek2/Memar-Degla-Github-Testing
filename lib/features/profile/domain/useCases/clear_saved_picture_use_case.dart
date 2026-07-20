import 'package:memar_degla/features/profile/domain/repo/profile_repo.dart';

class ClearProfilePictureUseCase {
  const ClearProfilePictureUseCase(this._repository);

  final ProfilePictureRepository _repository;

  Future<void> call() {
    return _repository.clearProfilePicture();
  }
}
