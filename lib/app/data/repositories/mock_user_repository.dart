import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/helpers/errors/errors.dart';

class MockUserRepository implements UserRepository {
  List<UserEntity> users = [
    const UserEntity(id: 1, name: 'User 1', isActive: true),
    const UserEntity(id: 2, name: 'User 2', isActive: false),
    const UserEntity(id: 3, name: 'User 3', isActive: true),
  ];

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity model) async {
    for (var i = 0; i < users.length; i++) {
      if (users[i].id == model.id) {
        users.removeWhere((element) => element.id == model.id);
        users.insert(i, model);
        return Future.value(right(model));
      }
    }

    return left(NoItemsFound(message: '${model.id}'));
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    if (users.every((user) => user.id != id)) {
      return left(NoItemsFound(message: '$id'));
    }
    users.removeWhere((user) => user.id == id);
    return right(unit);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAll() async {
    return right(users);
  }

  @override
  Future<Either<Failure, UserEntity>> insert(UserEntity model) async {
    if (users.any((user) => user.id == model.id)) {
      return left(ErrorRequest(message: '${model.id}'));
    }
    users.add(model);
    return right(model);
  }
}
