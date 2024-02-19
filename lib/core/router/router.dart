import 'package:go_router/go_router.dart';
import 'package:shop_lifter/feature/home_screen/home_screen.dart';
import 'package:shop_lifter/feature/login_screen/login_screen.dart';
import 'package:shop_lifter/feature/register_screen/register_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);
