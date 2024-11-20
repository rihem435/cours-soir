import 'package:app/controller/profile_controller.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/core/widgets/app_input_text.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends GetView<ProfileController> {
  bool obscureText = false;

  TextEditingController? passwordController;

  TextEditingController? newPasswordController;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  void showPassword() {
    //setState(() {
    obscureText = !obscureText;
    // });
    print("obscuretext $obscureText");
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  Text(
                    "Set a new password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Create a new password."
                    " Ensure it differs from previous ones for security",
                    style: TextStyle(color: AppColors.greyColor, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  AppInputText(
                    label: 'Password',
                    hintText: "*********",
                    prefixIcon: Icons.lock,
                    suffix: IconButton(
                      onPressed: () {
                        showPassword();
                      },
                      icon: Icon(
                        //++*************************************visibility
                        // condition ? conditionTrue : conditionFalse
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        //++*************************************visibility
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                    obscureText: obscureText,
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  AppInputText(
                    prefixIcon: Icons.lock,
                    label: "Confirm Password ",
                    hintText: "Enter confirm password",
                    controller: newPasswordController,
                    obscureText: obscureText,
                    suffix: IconButton(
                      onPressed: () {
                        showPassword();
                      },
                      icon: Icon(
                        //++*************************************visibility
                        // condition ? conditionTrue : conditionFalse
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        //++*************************************visibility
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  AppButton(
                      text: Text("confirmer"),
                      onPressed: () {
                        if (keyForm.currentState!.validate()) {
                          controller.verifyCodeAndResetPassword();
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
