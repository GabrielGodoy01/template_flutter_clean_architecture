import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/data/models/user_model.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/enums/http_status_code_enum.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/functions/get_http_status_function.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/services/http_service.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';

import 'package:uno/uno.dart';

class UnoUserRepository implements UserRepository {
  final _httpService = injector.get<IHttpService>();

  UnoUserRepository();

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      Response response = await _httpService.delete('/user/$id');
      if (response.status == 200) {
        return right(unit);
      }
      throw Exception();
    } on UnoError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response?.status ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAll() async {
    try {
      return await _httpService.get('/user').then((response) {
        if (response.status == 200) {
          var users = response.data.map((e) => UserModel.fromJson(e)).toList();
          return right(users);
        }
        throw Exception();
      });
    } on UnoError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response?.status ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> insert(String name) async {
    try {
      return await _httpService.post(
        '/user',
        data: {
          'name': name,
        },
      ).then((response) {
        if (response.status == 201) {
          var data = response.data;
          var user = UserModel.fromJson(data);
          return right(user);
        }
        throw Exception();
      });
    } on UnoError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response?.status ?? HttpStatus.badRequest);
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
        if (response.status == 200) {
          var data = response.data;
          var user = UserModel.fromJson(data);
          return right(user);
        }
        throw Exception();
      });
    } on UnoError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response?.status ?? HttpStatus.badRequest);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
