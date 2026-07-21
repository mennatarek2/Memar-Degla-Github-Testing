import 'package:dartz/dartz.dart';
import 'package:memar_degla/core/error/failures.dart';
import 'package:memar_degla/features/profile/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, String>> saveProfile(UserProfile profile);
  Future<Either<Failure, UserProfile>> getProfile();
}
