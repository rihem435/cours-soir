import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/theme/styles.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;

  void showPassword() {
    //point ! not
    setState(() {
      obscureText = !obscureText;
    });

    print("obscuretext $obscureText");
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
          child: Column(
            children: [
              Text(
                "Welcome Back!",
                style: TextStyles.font24BlackBold,
              ),
              SizedBox(
                height: 175,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Email',
                  ),
                  hintText: "name@example.com",
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.greyColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.greyColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.redColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
                obscureText: false,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                  ),
                  hintText: "*********",
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.greyColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.greyColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.redColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      showPassword();
                    },
                    icon: Icon(
                      //++*************************************visibility
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      //++*************************************visibility
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
                obscureText: obscureText,
              ),
              SizedBox(
                height: 175,
              ),
              AppButton(
                text: Text("Sign In"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
