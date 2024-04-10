import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';

class UserEntity {
  final int id;
  final String name;
  final StateEnum state;

  const UserEntity({required this.id, required this.name, required this.state});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "state": state,
    };
  }
}
