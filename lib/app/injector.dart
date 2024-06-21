import 'package:auto_injector/auto_injector.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/create_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/fetch_users_usecase.dart';
import 'package:flutter_clean_architecture_template/app/domain/usecases/update_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/presentation/stores/providers/user_provider.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/environments/environment_config.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/http_clients/dio_http_client.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/http_clients/http_client.dart';

abstract class Injector {
  T get<T extends Object>();
  void replace<T extends Object>(T instance);
}

// ignore: unused_element
class _AutoInjector implements Injector {
  final injector = AutoInjector();

  _AutoInjector() {
    _register();
  }

  void _register() {
    injector.addLazySingleton(Logger.new);
    injector.add<IHttpClient>(DioHttpClient.new);
    injector.addLazySingleton(UserProvider.new);
    injector.addLazySingleton<UserRepository>(
        () => EnvironmentConfig.getUserRepo());
    injector.addLazySingleton<IFetchUsersUsecase>(
        () => FetchUsersUsecase(repository: injector.get<UserRepository>()));
    injector.addLazySingleton<ICreateUserUsecase>(
        () => CreateUserUsecase(repository: injector.get<UserRepository>()));
    injector.addLazySingleton<IDeleteUserUsecase>(
        () => DeleteUserUsecase(repository: injector.get<UserRepository>()));
    injector.addLazySingleton<IUpdateUserUsecase>(
        () => UpdateUserUsecase(repository: injector.get<UserRepository>()));
    injector.commit();
  }

  @override
  T get<T extends Object>() {
    return injector.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    injector.replaceInstance<T>(instance);
  }
}

// ignore: unused_element
class _GetItImpl implements Injector {
  _GetItImpl() {
    _register();
  }

  void _register() {
    GetIt.I.registerLazySingleton(() => Logger());
    GetIt.I.registerFactory<IHttpClient>(() => DioHttpClient());
    GetIt.I.registerLazySingleton(() => UserProvider(
          injector.get<ICreateUserUsecase>(),
          injector.get<IDeleteUserUsecase>(),
          injector.get<IFetchUsersUsecase>(),
          injector.get<IUpdateUserUsecase>(),
        ));
    GetIt.I.registerLazySingleton<UserRepository>(
        () => EnvironmentConfig.getUserRepo());
    GetIt.I.registerLazySingleton<IFetchUsersUsecase>(
        () => FetchUsersUsecase(repository: injector.get<UserRepository>()));
    GetIt.I.registerLazySingleton<ICreateUserUsecase>(
        () => CreateUserUsecase(repository: injector.get<UserRepository>()));
    GetIt.I.registerLazySingleton<IDeleteUserUsecase>(
        () => DeleteUserUsecase(repository: injector.get<UserRepository>()));
    GetIt.I.registerLazySingleton<IUpdateUserUsecase>(
        () => UpdateUserUsecase(repository: injector.get<UserRepository>()));
  }

  @override
  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    GetIt.I.unregister<T>(instance: instance);
    GetIt.I.registerSingleton<T>(instance);
  }
}

final Injector injector = _AutoInjector();
