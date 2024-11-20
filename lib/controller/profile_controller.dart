import 'package:app/core/networking/app_api.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:app/screen/verfiy_code_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as di;

class ProfileController extends GetxController {
  di.Dio dio = di.Dio();

  logOut() async {
    di.Response response = await dio.get(
      AppApi.logOutUrl,
      options: di.Options(
        headers: {
          'Authorization': 'Bearer ${AppStorage.readAccessToken()}',
        },
      ),
    );
    if (response.statusCode == 200) {
      Get.offAll(SignInScreen());
    }
  }

  TextEditingController? emailController;
  TextEditingController? code1Controller;
  TextEditingController? code2Controller;
  TextEditingController? code3Controller;
  TextEditingController? code4Controller;
  TextEditingController? code5Controller;
  TextEditingController? code6Controller;
  TextEditingController? passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    code1Controller = TextEditingController();
    code2Controller = TextEditingController();
    code3Controller = TextEditingController();
    code4Controller = TextEditingController();
    code5Controller = TextEditingController();
    code6Controller = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  forgotPassword() async {
    Map<String, String> data = {
      "email": emailController!.text,
    };
    try {
      di.Response response = await dio.post(
        AppApi.forgetUrl,
        data: data,
      );
      if (response.statusCode == 201) {
        Get.snackbar(
          "success",
          "verify your email,",
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor,
        );
        Get.to(VerifyCodeScreen());
      }
    } catch (e) {}
  }

  verifyCodeAndResetPassword() async {
    Map<String, String> data = {
      "password": passwordController!.text,
    };
    try {
      di.Response response = await dio.post(
        "${AppApi.resetVerifyCodeUrl}${AppStorage.readCode()}",
        data: data,
      );
      if (response.statusCode == 201) {
        Get.snackbar(
          "success",
          "Password has been reset successfully,",
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor,
        );
        Get.offAll(SignInScreen());
      }
    } catch (e) {}
  }
}
