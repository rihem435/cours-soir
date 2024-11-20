import 'package:app/core/networking/app_api.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/model/user/user_model.dart';
import 'package:app/screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as di;

class LoginController extends GetxController {
  bool obscureText = true;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  di.Dio dio = di.Dio();

  UserModel? userModel;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  login() async {
    try {
      Map<String, String> data = {
        "email": emailController!.text,
        "password": passwordController!.text,
      };
      di.Response response = await dio.post(AppApi.loginUrl, data: data);
      if (response.statusCode == 201) {
        print("response =======>${response.data}");

        userModel = UserModel.fromJson(response.data);

        if (userModel!.user!.items == "client") {
          AppStorage.saveEmail(userModel!.user!.email!);
          AppStorage.saveUserName(userModel!.user!.fullname!);
          AppStorage.savevAccessToken(userModel!.tokens!.accessToken!);

          Get.to(HomeScreen());
        }
      }
    } on di.DioException catch (error) {
      if (error.type == di.DioExceptionType.badResponse) {
        Get.snackbar(
          "error",
          "password  or email is incorrect",
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (error) {
      print("error*******************************");
      Get.snackbar(
        "error",
        "password  or email is incorrect",
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  void showPassword() {
    obscureText = !obscureText;
    update();
  }
}
