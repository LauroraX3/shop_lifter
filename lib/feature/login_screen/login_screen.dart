import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_lifter/feature/login_screen/notifier/login_%20notifier.dart';
import 'package:shop_lifter/feature/register_screen/text_field.dart';
import 'package:shop_lifter/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lifter/utils/dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoginNotifier>(
        create: (context) => LoginNotifier(),
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 60),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Shop Lifter',
                      style: TextStyle(
                        fontSize: 36,
                        color: AppColors.darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      'assets/images/muscle.svg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.darkGreen,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Kupuj bez dźwigania ',
                          ),
                          TextSpan(
                            text: 'online',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(height: 30),
                  Text(
                    'Zaloguj się',
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    text: 'e-mail...',
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    text: 'hasło...',
                    isPassword: true,
                    hasIcon: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => context.push('/home'),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Zaloguj się'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGreen,
                      foregroundColor: AppColors.lightBeige,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nie masz konta?',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.lightGreen,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/register');
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Zarejestruj się',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.darkGreen,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.darkGreen,
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      final error =
                          await context.read<LoginNotifier>().anonymousSignIn();

                      if (error != null) {
                        showFailureAlert(context, error);
                      } else {
                        context.pushReplacement('/home');
                      }
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Kontynuuj jako gość',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.darkGreen,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.darkGreen,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
