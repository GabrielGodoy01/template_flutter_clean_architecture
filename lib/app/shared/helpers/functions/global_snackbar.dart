import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/shared/themes/app_colors.dart';
import 'package:flutter_clean_architecture_template/app/shared/themes/app_text_styles.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class GlobalSnackBar {
  static void error(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 97, 15, 9),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
      ),
    ));
  }

  static void success(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 29, 54, 1),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
      ),
    ));
  }
}
