import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class GlobalSnackBar {
  static void error(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      width: 600,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      content: Text(
        message,
        // style: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
      ),
    ));
  }

  static void success(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      width: 600,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      content: Text(
        message,
        // style: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
      ),
    ));
  }
}
