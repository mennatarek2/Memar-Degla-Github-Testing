import 'package:memar_degla/features/profile/data/data_source/user_profile_local_data_source.dart';
import 'package:memar_degla/features/profile/data/profile_local_data_source.dart';
import 'package:memar_degla/features/profile/domain/repo/profile_repo.dart';

/// Implements the domain contract using the local (SharedPreferences)
/// data source. This is the one concrete piece the presentation layer
/// never sees directly — it only ever depends on
/// [ProfilePictureRepository].
class ProfilePictureRepositoryImpl implements ProfilePictureRepository {
  const ProfilePictureRepositoryImpl(this._localDataSource);

  final ProfilePictureLocalDataSource _localDataSource;

  @override
  Future<void> saveProfilePicturePath(String path) {
    return _localDataSource.savePath(path);
  }

  @override
  Future<String?> getProfilePicturePath() async {
    return _localDataSource.getPath();
  }

  @override
  Future<void> clearProfilePicture() {
    return _localDataSource.clearPath();
  }
}
