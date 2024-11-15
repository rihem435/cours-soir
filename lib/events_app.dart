import 'package:app/screen/home_screen.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:app/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class EventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
