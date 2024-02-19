import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';
import 'package:shop_lifter/widgets/drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(
        bottom: BorderSide(
          color: AppColors.darkGreen,
          width: 2,
        ),
      ),
      backgroundColor: AppColors.lightBeige,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: AppColors.darkGreen,
          size: 34,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
          child: Stack(children: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: AppColors.darkGreen,
                size: 34,
              ),
              onPressed: () {},
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Badge(
                backgroundColor: AppColors.darkGreen,
                textColor: AppColors.lightBeige,
                padding: EdgeInsets.all(3),
                smallSize: 20,
                largeSize: 20,
                label: Text(
                  '99',
                  //style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.darkGreen,
              size: 34,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
