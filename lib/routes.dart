import 'package:go_router/go_router.dart';
import 'package:flutter_clean_architecture_template/app/modules/home/pages/home_page.dart';
import 'package:flutter_clean_architecture_template/app/modules/splash/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: routePaths.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

const routePaths = (home: '/home',);
