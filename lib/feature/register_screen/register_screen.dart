import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_lifter/feature/register_screen/button.dart';
import 'package:shop_lifter/feature/register_screen/notifier/register_notifier.dart';
import 'package:shop_lifter/feature/register_screen/text_field.dart';
import 'package:shop_lifter/styles/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:shop_lifter/utils/dialogs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var _postalCodeFormatter = MaskTextInputFormatter(
    mask: '##-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  String? _validateNameAndSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'To pole jest wymagane';
    } else if (value.length < 2) {
      return 'Pole mieć co najmniej 2 znaki';
    }
    return null;
  }

  String? _validateStreet(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Wprowadź prawidłowy numer budynku/mieszkania';
      }
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'To pole jest wymagane';
    } else if (!value.contains('@')) {
      return 'Niepoprawny adres email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'To pole jest wymagane';
    }
    if (value.length < 6) {
      return 'Hasło musi zawierać co najmniej 6 znaków';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jeden duży znak';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jedną cyfrę';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'To pole jest wymagane';
    }
    if (value != passwordController.text) {
      return 'Hasła nie są zgodne';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RegisterNotifier>.value(
        value: RegisterNotifier(),
        child: Builder(builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 60),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Rejestracja',
                          style: TextStyle(
                            fontSize: 36,
                            color: AppColors.darkGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        text: 'imię',
                        onChanged: (value) => context
                            .read<RegisterNotifier>()
                            .updateUserName(value),
                        validator: _validateNameAndSurname,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: 'nazwisko',
                        onChanged: (value) => context
                            .read<RegisterNotifier>()
                            .updateUserSurname(value),
                        validator: _validateNameAndSurname,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: 'ulica',
                        validator: _validateStreet,
                        onChanged: (value) => context
                            .read<RegisterNotifier>()
                            .updateStreet(value),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Flexible(
                              child: CustomTextField(
                                text: 'kod',
                                postalCodeFormatter: [_postalCodeFormatter],
                                onChanged: (value) => context
                                    .read<RegisterNotifier>()
                                    .updateUserZipCode(value),
                              ),
                              flex: 2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextField(
                                text: 'miejscowość',
                                onChanged: (value) => context
                                    .read<RegisterNotifier>()
                                    .updateUserTown(value),
                              ),
                              flex: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'e-mail',
                        validator: _validateEmail,
                        onChanged: (value) => context
                            .read<RegisterNotifier>()
                            .updateUserEmail(value),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'hasło',
                        validator: _validatePassword,
                        controller: passwordController,
                        isVisible: false,
                        isPassword: true,
                        hasIcon: true,
                        onChanged: (value) => context
                            .read<RegisterNotifier>()
                            .updateUserPassword(value),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListenableBuilder(
                        listenable: context.read<RegisterNotifier>(),
                        builder: (context, child) {
                          return CustomTextField(
                            text: 'powtórz hasło',
                            errorText: context
                                    .read<RegisterNotifier>()
                                    .isPasswordAndRepeatPasswordSame
                                ? null
                                : 'Hasła nie są takie same',
                            onChanged: (value) => context
                                .read<RegisterNotifier>()
                                .updateRepeatPassword(value),
                            isVisible: false,
                            isPassword: true,
                            hasIcon: true,
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      ListenableBuilder(
                        listenable: context.read<RegisterNotifier>(),
                        builder: (context, child) {
                          return SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              text: 'Zarejestruj się',
                              onPressed: context
                                      .read<RegisterNotifier>()
                                      .isUserValid
                                  ? () => context
                                          .read<RegisterNotifier>()
                                          .register()
                                          .then(
                                        (error) async {
                                          if (error != null) {
                                            showFailureAlert(context, error);
                                          } else {
                                            await showSuccessAlert(context);
                                            context.pop();
                                          }
                                        },
                                      )
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
