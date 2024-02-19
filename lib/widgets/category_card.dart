import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkBeige,
      shadowColor: AppColors.darkBeige,
      surfaceTintColor: AppColors.darkBeige,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          // Akcja po naciśnięciu karty
        },
        child: Container(
          height: 120,
          width: 120,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: ShapeDecoration(
                  color: AppColors.lightBeige,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    icon,
                    color: AppColors.darkGreen,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DecoratedBox(
                decoration: ShapeDecoration(
                  color: AppColors.lightBeige,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(color: AppColors.darkGreen),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
