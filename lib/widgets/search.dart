import 'package:flutter/material.dart';
import 'package:shop_lifter/styles/app_colors.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      child: Card(
        color: AppColors.lightGreen,
        surfaceTintColor: AppColors.lightGreen,
        shadowColor: AppColors.lightGreen,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: TextFormField(
            controller: _controller,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.darkBeige,
            ),
            textCapitalization: TextCapitalization.sentences,
            cursorColor: AppColors.darkGreen,
            decoration: const InputDecoration(
              hintText: 'Nazwa produktu',
              hintStyle: TextStyle(
                color: AppColors.lightBeige,
                //decoration: TextDecoration.none,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.lightBeige,
                size: 32,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
