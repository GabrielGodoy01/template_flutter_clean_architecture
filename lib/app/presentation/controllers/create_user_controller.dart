import 'dart:math';

import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';

class CreateUserController {
  final Random _random = Random();
  String _name = '';

  UserEntity get user => UserEntity(
      id: _random.nextInt(9000), name: _name, state: StateEnum.approved);

  void changeName(String name) {
    _name = name;
  }
}
