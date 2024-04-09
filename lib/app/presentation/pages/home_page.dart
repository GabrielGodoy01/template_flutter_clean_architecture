import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Container(),
    );
    // ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     final user = todoNotifier.users[index];
    //     return ListTile(
    //       leading: const Icon(Icons.person),
    //       title: Text(
    //         user.name,
    //       ),
    //       subtitle: Text('${user.id}'),
    //       trailing: IconButton(
    //         icon: const Icon(Icons.edit),
    //         onPressed: () => editUserDialog(context, user),
    //       ),
    //     );
    //   },
    // ));
  }

  void editUserDialog(BuildContext context, UserEntity user) {
    final TextEditingController _textEditingController =
        TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit user'),
          content: TextFormField(
            initialValue: user.name,
            controller: _textEditingController,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
