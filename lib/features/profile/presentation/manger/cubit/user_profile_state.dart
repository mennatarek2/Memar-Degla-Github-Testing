import 'package:memar_degla/core/error/failures.dart';
import 'package:memar_degla/features/profile/domain/entities/user_entity.dart';

sealed class UserProfileState {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  const UserProfileInitial();
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();
}

class UserProfileLoaded extends UserProfileState {
  final UserProfile profile;
  const UserProfileLoaded(this.profile);
}

class UserProfileError extends UserProfileState {
  final Failure failure;
  const UserProfileError(this.failure);
}

class UserProfileSaved extends UserProfileState {
  final String sucessMessage;

  UserProfileSaved({required this.sucessMessage});
}

class UserProfileSavingFailed extends UserProfileState {
  final String failedMessage;

  UserProfileSavingFailed({required this.failedMessage});
}
