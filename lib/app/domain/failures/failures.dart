import 'package:flutter_clean_architecture_template/app/injector.dart';
import 'package:flutter_clean_architecture_template/generated/l10n.dart';
import 'package:logger/logger.dart';

class Failure implements Exception {
  final String message;

  Failure({required this.message}) {
    injector.get<Logger>().e(
          '${DateTime.now()} - $message',
          error: this,
          stackTrace: StackTrace.current,
        );
  }
}

class ErrorRequest extends Failure {
  ErrorRequest({required String message})
      : super(message: S.current.requestErrorMessage('', message));
}

class NoItemsFound extends Failure {
  NoItemsFound({required String message})
      : super(message: S.current.noItemsFoundErrorMessage('', message));
}
