import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lifter/feature/register_screen/button.dart';
import 'package:shop_lifter/styles/app_colors.dart';

void showFailureAlert(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: SvgPicture.asset(
            'assets/images/failure.svg',
            width: 65,
            height: 65,
          ),
        ),
        content: Text(
          error,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.red,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
            width: double.infinity,
            child: CustomButton(
              text: 'Zamknij',
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: AppColors.red,
            ),
          )
        ],
      );
    },
  );
}

Future<void> showSuccessAlert(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: SvgPicture.asset(
            'assets/images/success.svg',
            width: 65,
            height: 65,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Pomyślna rejestracja',
            style: TextStyle(
              fontSize: 22,
              color: AppColors.darkGreen,
            ),
          ),
        ),
        actions: [
          Container(
            width: double.infinity,
            child: CustomButton(
              text: 'Zamknij',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      );
    },
  );
}
