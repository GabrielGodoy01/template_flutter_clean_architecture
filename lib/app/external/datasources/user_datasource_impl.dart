import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/data/adapters/user_adapter.dart';
import 'package:flutter_clean_architecture_template/app/data/datasources/user_datasource.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/model/http_client_error.dart';

class UserDatasourceImpl implements UserDatasource {
  final IHttpClient _httpClient;

  UserDatasourceImpl(this._httpClient);

  @override
  Future<void> delete(int id) async {
    try {
      await _httpClient.post(
        '/delete-user',
        data: {'id': id.toString()},
      );
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UnknownError(stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<List<UserEntity>> getAll() async {
    try {
      final response = await _httpClient.get('/get-all-users');

      return UserAdapter.fromJsonList(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UnknownError(stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<UserEntity> insert(String name) async {
    try {
      final response = await _httpClient.post(
        '/delete-user',
        data: {'id': id.toString()},
      );

      return UserAdapter.fromJson(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UnknownError(stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<UserEntity> update(UserEntity model) async {
    try {
      final response = await _httpClient.post(
        '/delete-user',
        data: {'id': id.toString()},
      );

      return UserAdapter.fromJson(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UnknownError(stackTrace: stackTrace);
      }
    }
  }
}
