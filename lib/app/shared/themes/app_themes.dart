import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/shared/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.black,
    brightness: Brightness.dark,
  );
}
