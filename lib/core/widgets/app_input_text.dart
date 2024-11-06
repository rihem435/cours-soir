import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppInputText extends StatelessWidget {
  final String? label;
  final String? hintText;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  const AppInputText(
      {Key? key,
      this.label,
      this.hintText,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.prefixIcon,
      this.obscureText,
      this.controller,
      this.validator,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: label != null
            ? Text(
                label!,
              )
            : null,
            
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.greyColor,
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: AppColors.greyColor,
                width: 2,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: AppColors.greyColor,
                width: 2,
              ),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: AppColors.redColor,
                width: 2,
              ),
            ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primaryColor,
          size: 20,
        ),
        suffix: suffix,
      ),
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
    );
  }
}
