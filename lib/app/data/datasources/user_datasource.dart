import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<List<UserEntity>> getAll();

  Future<UserEntity> insert(String name);

  Future<UserEntity> update(UserEntity model);

  Future<void> delete(int id);
}
