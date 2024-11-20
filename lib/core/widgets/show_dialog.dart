import 'package:app/controller/profile_controller.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog.
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.find<ProfileController>().logOut();
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}
