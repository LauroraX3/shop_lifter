import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Icon(
                icon,
                color: AppColors.lightBeige,
                size: 26,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                // Dodaj border na dole
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.darkGreen,
                    width: 2,
                  ),
                  top: BorderSide(
                    color: AppColors.darkGreen,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(
            width: 4,
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.lightBeige,
                  fontSize: 18,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                // Dodaj border na dole
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.darkGreen,
                    width: 2,
                  ),
                  top: BorderSide(
                    color: AppColors.darkGreen,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
