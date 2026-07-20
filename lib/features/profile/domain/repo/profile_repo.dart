abstract class ProfilePictureRepository {
  Future<void> saveProfilePicturePath(String path);
  Future<String?> getProfilePicturePath();
  Future<void> clearProfilePicture();
}
