import 'package:app/controller/profile_controller.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/core/widgets/app_input_text.dart';
import 'package:app/screen/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends GetView<ProfileController> {
  const VerifyCodeScreen({Key? key}) : super(key: key);

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
                child: Column(children: [
                  Text(
                    "Check your email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                        text: "We sent a reset link to",
                        style:
                            TextStyle(color: AppColors.greyColor, fontSize: 16),
                        children: [
                          TextSpan(
                              text: " contact@dscode...com",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          TextSpan(
                              text:
                                  "enter 5 digit code that mentioned in the email",
                              style: TextStyle(
                                  color: AppColors.greyColor, fontSize: 16))
                        ]),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                            controller: controller.code1Controller,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "code!";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                          controller: controller.code2Controller,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "code!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                            controller: controller.code3Controller,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "code!";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                            controller: controller.code4Controller,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "code!";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                           
                            controller: controller.code5Controller,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "code!";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: AppInputText(
                            controller: controller.code6Controller,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "code!";
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  AppButton(
                      text: Text("Verify Code"),
                      onPressed: () async {
                        await AppStorage.savevCode(
                            "${controller.code1Controller!.text}${controller.code2Controller!.text}${controller.code3Controller!.text}${controller.code4Controller!.text}${controller.code5Controller!.text}${controller.code6Controller!.text}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPasswordScreen()));
                      }),
                  SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                        text: "Haven’t got the email yet? ",
                        style:
                            TextStyle(color: AppColors.greyColor, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Resend email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ]))));
  }
}
