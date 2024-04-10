import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';
import 'package:flutter_clean_architecture_template/app/presentation/controllers/edit_user_controller.dart';
import 'package:flutter_clean_architecture_template/app/presentation/stores/providers/user_provider.dart';

class EditUserDialog extends StatefulWidget {
  final UserEntity user;
  late final EditUserController controller;
  EditUserDialog({super.key, required this.user}) {
    controller = EditUserController(user);
  }

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text('Edit user'),
          const Spacer(),
          IconButton(
            onPressed: () {
              injector
                  .get<UserProvider>()
                  .deleteUser(widget.controller.user.id);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      content: TextFormField(
        initialValue: widget.user.name,
        onChanged: (String value) {
          setState(() {
            widget.controller.changeUserName(value);
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            injector.get<UserProvider>().updateUser(widget.controller.user);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
