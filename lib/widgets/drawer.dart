import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';
import 'package:shop_lifter/widgets/app_bar.dart';
import 'package:shop_lifter/widgets/tile.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.darkGreen,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36, left: 16, bottom: 16),
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkGreen,
                    radius: 30,
                    child: Icon(
                      Icons.person_outline,
                      size: 32,
                      color: AppColors.lightBeige,
                    ), //Text
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 36, left: 16, right: 16, bottom: 16),
                  child: Text(
                    'Radzisław',
                    style: TextStyle(
                        fontSize: 28,
                        color: AppColors.darkGreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: InkWell(
              child: CustomTile(
                text: 'Ulubione',
                icon: Icons.favorite_border,
              ),
              onTap: () {},
            ),
          ),
          InkWell(
            child: CustomTile(
              text: 'Ustawienia',
              icon: Icons.settings_outlined,
            ),
            onTap: () {},
          ),
          Spacer(),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.darkGreen,
                  width: 2,
                ),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Wyloguj'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkGreen,
                foregroundColor: AppColors.lightBeige,
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // button's shape
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
