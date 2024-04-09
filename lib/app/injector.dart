import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/usecases/create_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/usecases/fetch_users_usecase.dart';
import 'package:flutter_clean_architecture_template/app/shared/domain/usecases/update_user_usecase.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/environments/environment_config.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/services/dio/dio_auth_interceptor.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/services/http_service.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<IHttpService>(DioHttpService.new);
  injector.addLazySingleton<Dio>(() => Dio()
    ..interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(),
    ]));
  injector
      .addLazySingleton<UserRepository>(() => EnvironmentConfig.getUserRepo());
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
