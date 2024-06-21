import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

class UserAdapter {
  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      state: json['state'],
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'state': user.state.name,
    };
  }
}
