import 'package:app/core/bindings/bindings.dart';
import 'package:app/screen/home_screen.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:app/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
