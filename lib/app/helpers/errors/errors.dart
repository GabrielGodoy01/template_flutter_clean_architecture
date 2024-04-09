import 'dart:developer';

import 'package:flutter_clean_architecture_template/generated/l10n.dart';

class Failure implements Exception {
  final String message;

  Failure({required this.message}) {
    log('${DateTime.now()} - $message', name: 'Failure');
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
