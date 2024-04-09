import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.isActive});

  UserModel copyWith({int? id, String? name, bool? isActive}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      isActive: map['isActive'],
    );
  }
}
