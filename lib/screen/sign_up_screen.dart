import 'package:app/core/networking/app_api.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/core/widgets/app_input_text.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? newpasswordController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Dio dio = Dio();
  signUp() async {
    try {
      Map<String, dynamic> data = {
        "items": "client",
        "fullname": nameController!.text,
        "email": emailController!.text,
        "password": passwordController!.text,
        "phone": int.tryParse(phoneController!.text)
      };
      Response response = await dio.post(AppApi.signUpUrl, data: data);
      if (response.statusCode == 202) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text(
              "item is incorrect",
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        );
      }
    } catch (error) {
      print("error*******************************");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text(
            "An error occurred. Please try again.",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    newpasswordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                Text(
                  "Create new  account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                AppInputText(
                    prefixIcon: Icons.person,
                    label: "Full name",
                    hintText: "Enter your name",
                    controller: nameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "name is required";
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                AppInputText(
                    prefixIcon: Icons.email,
                    label: "Email adress",
                    hintText: "name@example.com",
                    controller: emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "email is required";
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                AppInputText(
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.person,
                    label: "Phone Number",
                    hintText: "21455654",
                    controller: phoneController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "phone number is required";
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                AppInputText(
                    prefixIcon: Icons.lock,
                    label: "Create password ",
                    hintText: "Enter your password",
                    controller: passwordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                AppInputText(
                    prefixIcon: Icons.lock,
                    label: "Confirm Password ",
                    hintText: "Enter confirm password",
                    controller: newpasswordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm password is required";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                    text: Text("sign up"),
                    onPressed: () {
                      print('email: $emailController');
                      print('email ====${emailController!.text}');
                      if (keyForm.currentState!.validate()) {
                        print('********************');
                        signUp();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
