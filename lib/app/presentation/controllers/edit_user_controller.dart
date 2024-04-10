import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

class EditUserController {
  final UserEntity _user;
  late String _userName;

  EditUserController(this._user) {
    _userName = _user.name;
  }

  UserEntity get user =>
      UserEntity(id: _user.id, name: _userName, state: _user.state);

  void changeUserName(String name) {
    _userName = name;
  }
}
