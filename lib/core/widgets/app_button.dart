import 'package:app/core/theme/app_colors.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;
  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor, this.borderSide,
   
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: foregroundColor ?? AppColors.whiteColor,
        fixedSize: Size(
          317,
          60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
       
          side: borderSide ?? BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}
