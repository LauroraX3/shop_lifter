import 'package:flutter/material.dart';
import 'package:shop_lifter/core/auth/auth.dart';

class LoginNotifier extends ChangeNotifier {
  final _authService = Auth();

  Future<String?> anonymousSignIn() async {
    final response = await _authService.anonymousSignIn();

    if (response.isLeft) {
      return response.left.message;
    }
  }
}
