import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';

abstract class IDeleteUserUsecase {
  Future<Either<Failure, Unit>> call(int id);
}

class DeleteUserUsecase implements IDeleteUserUsecase {
  final UserRepository repository;

  DeleteUserUsecase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.delete(id);
  }
}
