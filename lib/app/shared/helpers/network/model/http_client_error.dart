import 'package:flutter_clean_architecture_template/app/domain/failures/failures.dart';
import 'package:flutter_clean_architecture_template/generated/l10n.dart';

class HttpClientError extends Failure {
  HttpClientError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}

class TimeOutError extends Failure {
  TimeOutError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}
