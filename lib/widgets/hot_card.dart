import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';

class HotCard extends StatelessWidget {
  const HotCard({super.key, required this.price, required this.imagePath});

  final String price;
  final String imagePath;

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
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              print('2'); // Akcja po naciśnięciu karty
            },
            child: Container(
              height: 180,
              width: 140,
              //padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15.0), // Tu ustawiasz promień zaokrąglenia rogów
                      child: Image.network(
                        imagePath,
                        width: 110, // Szerokość zdjęcia
                        height: 65, // Wysokość zdjęcia
                        fit: BoxFit.cover, // Sposób dopasowania zdjęcia
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'gwiazdki',
                                      style: TextStyle(
                                          color: AppColors.lightBeige,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '+500 sprzedano',
                                      style: TextStyle(
                                          color: AppColors.lightBeige,
                                          fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      price,
                                      style: TextStyle(
                                        color: AppColors.lightBeige,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 18,
                                      width: 60,
                                      child: Chip(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        label: Center(
                                          child: const Text(
                                            'Aaron',
                                            style: TextStyle(
                                              color: AppColors.darkGreen,
                                              fontSize: 7,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 3,
            left: 3,
            child: InkWell(
              onTap: () {
                print('1'); // Akcja po naciśnięciu serca
              },
              child: Icon(
                Icons.favorite_border,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
