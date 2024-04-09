import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/failures/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAll();

  Future<Either<Failure, UserEntity>> insert(UserEntity model);

  Future<Either<Failure, UserEntity>> update(UserEntity model);

  Future<Either<Failure, Unit>> delete(int id);
}
