import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/functions/global_snackbar.dart';
import 'package:flutter_clean_architecture_template/app/shared/themes/app_themes.dart';
import 'package:flutter_clean_architecture_template/generated/l10n.dart';
import 'package:flutter_clean_architecture_template/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      title: 'Clean Architecture Template',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
