import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.state});

  UserModel copyWith({int? id, String? name, StateEnum? state}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      state: StateEnum.values.firstWhere(
        (element) =>
            element.name.toUpperCase() == map['state'].toString().toUpperCase(),
      ),
    );
  }
}
