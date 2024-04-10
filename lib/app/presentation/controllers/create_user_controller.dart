import 'dart:math';

import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

class CreateUserController {
  final Random _random = Random();
  String _name = '';

  get user =>
      UserEntity(id: _random.nextInt(9000), name: _name, isActive: true);

  void changeName(String name) {
    _name = name;
  }
}
