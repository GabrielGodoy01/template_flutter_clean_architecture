import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/app/data/datasources/user_datasource.dart';
import 'package:flutter_clean_architecture_template/app/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_template/app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;

  UserRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      await _datasource.delete(id);

      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAll() async {
    try {
      final result = await _datasource.getAll();

      if (result.isEmpty) {
        return Left(NoDataFound());
      }

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> insert(String name) async {
    try {
      final result = await _datasource.insert(name);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity user) async {
    try {
      final result = await _datasource.update(user);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }
}
