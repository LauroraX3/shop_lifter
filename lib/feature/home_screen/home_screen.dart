import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_lifter/styles/app_colors.dart';
import 'package:shop_lifter/widgets/app_bar.dart';
import 'package:shop_lifter/widgets/category_card.dart';
import 'package:shop_lifter/widgets/drawer.dart';
import 'package:shop_lifter/widgets/hot_card.dart';
import 'package:shop_lifter/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.welcome),
            Search(),
            SizedBox(height: 18),
            Text(
              'Kategoria',
              style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryCard(
                    icon: Icons.flash_on,
                    text: 'Elektryka',
                  ),
                  CategoryCard(
                    icon: Icons.home_outlined,
                    text: 'Dom',
                  ),
                  CategoryCard(
                    icon: Icons.clean_hands_outlined,
                    text: 'Chemia',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'HOT',
              style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ostatnio oglądane',
              style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                  HotCard(
                    price: '89,76zł',
                    imagePath:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
