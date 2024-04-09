import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/failures/failures.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, UserEntity>> call(UserEntity user);
}

class CreateUserUsecase implements ICreateUserUsecase {
  final UserRepository repository;

  CreateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.insert(user);
  }
}
