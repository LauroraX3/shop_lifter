import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shop_lifter/styles/app_colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.text,
    this.validator,
    this.postalCodeFormatter,
    this.controller,
    this.onChanged,
    this.errorText,
    this.isVisible = true,
    this.isPassword = false,
    this.hasIcon = false,
  }) : super(key: key);

  final String text;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? postalCodeFormatter;
  final TextEditingController? controller;

  final void Function(String)? onChanged;

  final String? errorText;

  bool isVisible;
  bool isPassword;
  bool hasIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword && widget.isVisible,
      controller: widget.controller,
      inputFormatters: widget.postalCodeFormatter,
      validator: widget.validator,
      cursorColor: AppColors.darkGreen,
      onChanged: widget.onChanged,
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.darkGreen,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        filled: true,
        fillColor: AppColors.darkBeige,
        labelText: widget.text,
        labelStyle: TextStyle(color: AppColors.darkGreen, fontSize: 20),
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    widget.isVisible
                        ? 'assets/images/closed_eye.svg'
                        : 'assets/images/opened_eye.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
