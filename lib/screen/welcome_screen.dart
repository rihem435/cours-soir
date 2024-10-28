import 'package:app/core/theme/app_colors.dart';
import 'package:app/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 36.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            //espace entre les deux texts
            SizedBox(
              height: 20,
            ),
            Text(
              "Sing in or creat a new account",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 93,
            ),
            Image.asset(
              "assets/images/frame.png",
              width: 320.64,
              height: 248.93,
            ),
            SizedBox(
              height: 93,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                fixedSize: Size(
                  317,
                  60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  // side: BorderSide(
                  //   color: Colors.black,
                  //   width: 3,
                  // ),
                ),
              ),
              onPressed: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
              child: Text(
                'Sign in',
              ),
            ),
          
          
          
          
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                fixedSize: Size(
                  317,
                  60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  side: BorderSide(
                    color: AppColors.greyColor,
                    width: 1,
                  ),
                ),
              ),
              onPressed: () => print('click button'),
              child: const Text.rich(
                TextSpan(
                  text: "No account yet? ",
                  style: TextStyle(
                    color: AppColors.greyColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Sing up",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
