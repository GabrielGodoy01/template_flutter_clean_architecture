import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';

abstract class IFetchUsersUsecase {
  Future<Either<Failure, List<UserEntity>>> call();
}

class FetchUsersUsecase implements IFetchUsersUsecase {
  final UserRepository repository;

  FetchUsersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.getAll();
  }
}
