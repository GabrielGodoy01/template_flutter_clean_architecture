import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAll();

  Future<Either<Failure, UserEntity>> insert(String name);

  Future<Either<Failure, UserEntity>> update(UserEntity model);

  Future<Either<Failure, Unit>> delete(int id);
}
