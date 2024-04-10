import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';
import 'package:flutter_clean_architecture_template/app/presentation/states/user_state.dart';
import 'package:flutter_clean_architecture_template/app/presentation/stores/providers/user_provider.dart';
import 'package:flutter_clean_architecture_template/app/presentation/widgets/dialogs/create_user_dialog.dart';
import 'package:flutter_clean_architecture_template/app/presentation/widgets/dialogs/edit_user_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => injector.get<UserProvider>()..fetchUsers(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Consumer<UserProvider>(builder: (context, todoNotifier, child) {
          var state = todoNotifier.state;
          return state is UserSuccessState
              ? buildSuccess(state)
              : state is UserErrorState
                  ? buildError(state)
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
                      ),
                    );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const CreateUserDialog(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildSuccess(UserSuccessState successState) {
    return ListView.builder(
      itemCount: successState.users.length,
      itemBuilder: (context, index) {
        final user = successState.users[index];
        return ListTile(
          leading: const Icon(Icons.person, color: Colors.deepPurpleAccent),
          title: Text(
            user.name,
            style: const TextStyle(color: Colors.deepPurpleAccent),
          ),
          subtitle: Text(
            '${user.id}',
            style: const TextStyle(color: Colors.deepPurpleAccent),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.deepPurpleAccent),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => EditUserDialog(user: user),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildError(UserErrorState errorState) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          injector.get<UserProvider>().fetchUsers();
        },
        child: const Text('Try again'),
      ),
    );
  }
}
