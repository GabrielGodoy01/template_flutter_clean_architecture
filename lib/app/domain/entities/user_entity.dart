import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_template/app/domain/enum/state_enum.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final StateEnum state;

  const UserEntity({
    required this.id,
    required this.name,
    required this.state,
  });

  @override
  List<Object> get props => [id];
}
