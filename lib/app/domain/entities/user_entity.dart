class UserEntity {
  final int id;
  final String name;
  final bool isActive;

  const UserEntity(
      {required this.id, required this.name, required this.isActive});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "isActive": isActive,
    };
  }
}
