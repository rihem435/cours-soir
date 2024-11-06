import 'package:app/core/helpers/app_regex.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/theme/styles.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/core/widgets/app_input_text.dart';
import 'package:app/screen/forgot_password_screen.dart';
import 'package:app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  void showPassword() {
    //point ! not
    setState(() {
      obscureText = !obscureText;
    });

    print("obscuretext $obscureText");
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 25,
          ),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyles.font24BlackBold,
                ),
                const SizedBox(
                  height: 175,
                ),

                /************************************app_input_tet */
                AppInputText(
                  label: 'Email',
                  hintText: "name@example.com",
                  prefixIcon: Icons.email,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email is required";
                    } else if (!AppRegex.isEmailValid(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                /************************************app_input_tet */

                SizedBox(
                  height: 30,
                ),
                /************************************app_input_tet */
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
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    }
                    return null;
                  },
                ),
                /************************************app_input_tet */
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
                ),
                AppButton(
                  text: Text("Sign In"),
                  onPressed: () {
                    print('email: $emailController');
                    print('email ====${emailController!.text}');

                    if (keyForm.currentState!.validate()) {
                      print("form valide");
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
