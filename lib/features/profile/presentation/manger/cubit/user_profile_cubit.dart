import 'package:bloc/bloc.dart';
import 'package:memar_degla/features/profile/domain/entities/user_entity.dart';
import 'package:memar_degla/features/profile/domain/repo/user_repo.dart';
import 'package:memar_degla/features/profile/presentation/manger/cubit/user_profile_state.dart';
import 'package:meta/meta.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserRepo repository;
  UserProfileCubit(this.repository) : super(const UserProfileInitial());

  Future<void> loadProfile() async {
    emit(const UserProfileLoading());
    final result = await repository.getProfile();
    result.fold(
      (failure) => emit(UserProfileError(failure)),
      (profile) => emit(UserProfileLoaded(profile)),
    );
  }

  Future<void> saveProfile({
    required String name,
    required String phoneNumber,
    required String code,
    required String email,
  }) async {
    emit(const UserProfileLoading());
    final profile = UserProfile(
      email: email,
      name: name,
      phone: phoneNumber,
      code: code,
    );
    final result = await repository.saveProfile(profile);
    result.fold(
      (failure) =>
          emit(UserProfileSavingFailed(failedMessage: failure.message!)),
      (sucessMessage) => emit(UserProfileSaved(sucessMessage: sucessMessage)),
    );
  }
}
