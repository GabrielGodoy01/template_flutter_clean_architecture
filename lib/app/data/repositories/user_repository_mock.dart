import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';

class UserRepositoryMock implements UserRepository {
  List<UserEntity> users = [
    const UserEntity(id: 1, name: 'User 1', state: StateEnum.approved),
    const UserEntity(id: 2, name: 'User 2', state: StateEnum.approved),
    const UserEntity(id: 3, name: 'User 3', state: StateEnum.approved),
  ];

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity model) async {
    for (var i = 0; i < users.length; i++) {
      if (users[i].id == model.id) {
        users.removeWhere((element) => element.id == model.id);
        users.insert(i, model);
        return right(model);
      }
    }

    return left(
      UpdateUserError(stackTrace: null, errorMessage: 'User not found'),
    );
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    if (users.every((user) => user.id != id)) {
      return left(
        DeleteUserError(stackTrace: null, errorMessage: 'User not found'),
      );
    }
    users.removeWhere((user) => user.id == id);
    return right(unit);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAll() async {
    if (users.isEmpty) {
      return left(NoDataFound());
    }
    return right(users);
  }

  @override
  Future<Either<Failure, UserEntity>> insert(String name) async {
    final model = UserEntity(
      id: users.length + 1,
      name: name,
      state: StateEnum.pending,
    );
    users.add(model);
    return right(model);
  }
}
