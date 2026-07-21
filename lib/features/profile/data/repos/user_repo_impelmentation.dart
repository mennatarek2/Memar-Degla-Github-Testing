import 'package:dartz/dartz.dart';
import 'package:memar_degla/core/error/exception_to_failure_mapper.dart';
import 'package:memar_degla/core/error/exceptions.dart';
import 'package:memar_degla/core/error/failures.dart';

import 'package:memar_degla/features/profile/data/data_source/user_profile_local_data_source.dart';
import 'package:memar_degla/features/profile/domain/entities/user_entity.dart';
import 'package:memar_degla/features/profile/domain/repo/user_repo.dart';

class UserRepoImpelmentation implements UserRepo {
  final UserProfileLocalDataSource _userLocalDataSource;

  UserRepoImpelmentation({required this._userLocalDataSource});

  @override
  Future<Either<Failure, String>> saveProfile(UserProfile profile) async {
    try {
      await _userLocalDataSource.saveUserEmail(email: profile.email);
      await _userLocalDataSource.saveUserCode(userCode: profile.code);
      await _userLocalDataSource.saveUserFullName(userFullName: profile.name);
      await _userLocalDataSource.saveUserPhoneNumber(phoneNumber: profile.name);
      return right("user Profile Saved");
    } on AppException catch (e) {
      return Left(ExceptionToFailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getProfile() async {
    try {
      final email = await _userLocalDataSource.getUserEmail();
      final name = await _userLocalDataSource.getUserFullname();
      final phone = await _userLocalDataSource.getUserPhoneNumber();
      final code = await _userLocalDataSource.getUserCode();

      return Right(
        UserProfile(email: email, name: name, phone: phone, code: code),
      );
    } on AppException catch (e) {
      return Left(ExceptionToFailureMapper.map(e));
    }
  }
}
