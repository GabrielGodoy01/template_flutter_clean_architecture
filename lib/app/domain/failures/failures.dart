import 'package:flutter_clean_architecture_template/app/injector.dart';
import 'package:flutter_clean_architecture_template/generated/l10n.dart';
import 'package:logger/logger.dart';

class Failure implements Exception {
  String errorMessage;

  Failure({
    required this.errorMessage,
    StackTrace? stackTrace,
  }) {
    injector.get<Logger>().e(
          errorMessage,
          time: DateTime.now(),
          error: this,
          stackTrace: stackTrace,
        );
  }
}

class NoDataFound extends Failure {
  NoDataFound() : super(errorMessage: S.current.noDataFoundError);
}

class NoInternetConnection extends Failure {
  NoInternetConnection()
      : super(errorMessage: S.current.noInternetConnectionError);
}

class UnknownError extends Failure {
  final StackTrace? stackTrace;

  UnknownError({
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: S.current.unknownError,
        );
}

class DeleteUserError extends Failure {
  DeleteUserError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class GetAllUsersError extends Failure {
  GetAllUsersError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class CreateUserError extends Failure {
  CreateUserError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UpdateUserError extends Failure {
  UpdateUserError({
    required super.stackTrace,
    required super.errorMessage,
  });
}
