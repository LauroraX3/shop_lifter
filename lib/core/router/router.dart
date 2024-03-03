import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_lifter/core/auth/auth.dart';
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
      builder: (context, state) => const LoginScreen(),
      redirect: (_, __) {
        final authService = Auth();
        if (authService.isUserSignIn) {
          return '/home';
        }

        return null;
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
