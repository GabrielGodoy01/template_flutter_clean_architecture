import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';

class UserAdapter {
  static List<UserEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['user_id'],
      name: json['name'],
      state: StateEnum.values.firstWhere(
        (element) =>
            element.name.toUpperCase() ==
            json['state'].toString().toUpperCase(),
      ),
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'user_id': user.id,
      'name': user.name,
      'state': user.state.name,
    };
  }
}
