import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_template/app/data/models/user_model.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/helpers/enums/http_status_code_enum.dart';
import 'package:flutter_clean_architecture_template/app/helpers/errors/errors.dart';
import 'package:flutter_clean_architecture_template/app/helpers/functions/get_http_status_function.dart';
import 'package:flutter_clean_architecture_template/app/helpers/services/http_service.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';

class DioUserRepository implements UserRepository {
  final _httpService = injector.get<IHttpService>();

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      Response response = await _httpService.delete('/user/$id');
      if (response.statusCode == 200) {
        return right(unit);
      }
      throw Exception();
    } on DioException catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAll() async {
    try {
      return await _httpService.get('/user').then((response) {
        if (response.statusCode == 200) {
          var users = response.data.map((e) => UserModel.fromJson(e)).toList();
          return right(users);
        }
        throw Exception();
      });
    } on DioException catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> insert(UserEntity model) async {
    try {
      return await _httpService
          .post(
        '/user',
        data: model.toMap(),
      )
          .then((response) {
        if (response.statusCode == 201) {
          return right(UserModel.fromJson(response.data));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity model) async {
    try {
      return await _httpService
          .put(
        '/user/${model.id}',
        data: model.toMap(),
      )
          .then((response) {
        if (response.statusCode == 200) {
          return right(UserModel.fromJson(response.data));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
