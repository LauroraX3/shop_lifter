import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shop_lifter/core/auth/auth.dart';
import 'package:shop_lifter/models/user/user.dart';

class RegisterNotifier extends ChangeNotifier {
  final _authService = Auth();
  User _user = User.pure();
  String _repeatPassword = '';

  bool get isPasswordAndRepeatPasswordSame => _user.password == _repeatPassword;

  void updateUserName(String name) {
    _user = _user.copyWith(name: name);
    notifyListeners();
  }

  void updateUserSurname(String surname) {
    _user = _user.copyWith(surname: surname);
    notifyListeners();
  }

  void updateStreet(String street) => _user = _user.copyWith(street: street);
  void updateUserZipCode(String zipCode) =>
      _user = _user.copyWith(zipCode: zipCode);
  void updateUserTown(String town) => _user = _user.copyWith(town: town);
  void updateUserEmail(String email) {
    _user = _user.copyWith(email: email);
    notifyListeners();
  }

  void updateUserPassword(String password) {
    _user = _user.copyWith(password: password);
    notifyListeners();
  }

  void updateRepeatPassword(String repeatPassword) {
    _repeatPassword = repeatPassword;
    notifyListeners();
  }

  bool get isUserValid {
    return _user.name.isNotEmpty &&
        _user.surname.isNotEmpty &&
        _user.email.isNotEmpty &&
        (_user.password?.isNotEmpty ?? false) &&
        _repeatPassword.isNotEmpty &&
        isPasswordAndRepeatPasswordSame;
  }

  Future<String?> register() async {
    final response =
        await _authService.emailAndPasswordSignUp(_user.email, _user.password!);

    return response.fold(
      (appError) => appError.message,
      (userCredential) async {
        final uid = userCredential.user!.uid;
        final usersRef = FirebaseDatabase.instance.ref('users/');
        final ref = usersRef.push();
        await ref.set({uid: _user.copyWith(id: ref.key!).toJson()});
      },
    );
  }
}
