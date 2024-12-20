import 'package:app/controller/profile_controller.dart';
import 'package:app/core/helpers/app_regex.dart';
import 'package:app/core/networking/app_api.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/core/widgets/app_input_text.dart';
import 'package:app/screen/verfiy_code_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ProfileController> {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

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
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                Text(
                  "Forgot password",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Text.rich(TextSpan(
                    text: "Please enter your email to reset the password",
                    style:
                        TextStyle(color: AppColors.greyColor, fontSize: 16))),
                SizedBox(height: 34),
                AppInputText(
                  label: 'Email',
                  hintText: "name@example.com",
                  prefixIcon: Icons.email,
                  controller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email is required";
                    } else if (!AppRegex.isEmailValid(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                AppButton(
                    text: Text("Reset Password"),
                    onPressed: () {
                      if (keyForm.currentState!.validate()) ;
                      controller.forgotPassword();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
