import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/create_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/fetch_users_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/update_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';
import 'package:flutter_clean_architecture_template/app/presentation/states/user_state.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/functions/global_snackbar.dart';
import 'package:logger/logger.dart';

class UserProvider with ChangeNotifier {
  final ICreateUserUsecase _createUser;
  final IDeleteUserUsecase _deleteUser;
  final IFetchUsersUsecase _fetchUsers;
  final IUpdateUserUsecase _updateUser;

  UserProvider(
    this._createUser,
    this._deleteUser,
    this._fetchUsers,
    this._updateUser,
  );

  UserState state = UserInitialState();

  void setState(UserState value) {
    state = value;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    setState(UserLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _fetchUsers();
    setState(
      result.fold(
        (error) {
          GlobalSnackBar.error(error.message);
          return UserErrorState(error: error);
        },
        (users) {
          injector.get<Logger>().d(
                '${DateTime.now()} - Users fetched successfully!',
              );
          return UserSuccessState(users: users);
        },
      ),
    );
  }

  Future<void> createUser(String name) async {
    final result = await _createUser(name);
    setState(
      result.fold(
        (error) {
          GlobalSnackBar.error(error.message);
          return UserErrorState(error: error);
        },
        (createdUser) {
          GlobalSnackBar.success('User created successfully!');
          injector.get<Logger>().d(
                '${DateTime.now()} - User created successfully!',
              );
          final List<UserEntity> users = (state as UserSuccessState).users;
          users.insert(0, createdUser);
          return UserSuccessState(users: users);
        },
      ),
    );
  }

  Future<void> updateUser(UserEntity user) async {
    final result = await _updateUser(user);
    setState(
      result.fold(
        (error) {
          GlobalSnackBar.error(error.message);
          return UserErrorState(error: error);
        },
        (updatedUser) {
          GlobalSnackBar.success('User updated successfully!');
          injector.get<Logger>().d(
                '${DateTime.now()} - User updated successfully!',
              );
          final users = (state as UserSuccessState).users;
          final index =
              users.indexWhere((element) => element.id == updatedUser.id);
          users.removeAt(index);
          users.insert(index, updatedUser);
          return UserSuccessState(users: users);
        },
      ),
    );
  }

  Future<void> deleteUser(int id) async {
    final result = await _deleteUser(id);
    setState(
      result.fold(
        (error) {
          GlobalSnackBar.error(error.message);
          return UserErrorState(error: error);
        },
        (_) {
          GlobalSnackBar.success('User deleted successfully!');
          injector.get<Logger>().d(
                '${DateTime.now()} - User deleted successfully!',
              );
          final users = (state as UserSuccessState).users;
          users.removeWhere((element) => element.id == id);
          return UserSuccessState(users: users);
        },
      ),
    );
  }
}
