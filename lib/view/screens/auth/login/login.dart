import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/auth/forgot_password/forgot_password.dart';
import 'package:bio_pillow/view/screens/auth/sign_up/sign_up.dart';
import 'package:bio_pillow/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_check_box_widget.dart';
import 'package:bio_pillow/view/widget/heading_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_field_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                AuthHeading(
                  title: 'Login',
                  subTitle: 'Enter your credentials to login to your account',
                ),
                MyTextField(hintText: 'example@email.com'),
                MyTextField(
                  marginBottom: 12,
                  hintText: 'Password',
                  isObSecure: true,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesVisibility, height: 20),
                    ],
                  ),
                ),
                MyText(
                  text: 'Forgot Password?',
                  onTap: () {
                    Get.to(() => ForgotPassword());
                  },
                  size: 12,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.end,
                  color: kSecondaryColor,
                ),
                SizedBox(height: 30),
                MyButton(
                  buttonText: 'Login',
                  onTap: () {
                    Get.to(() => BottomNavBar());
                  },
                ),
                SizedBox(height: 30),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(child: Container(height: 1, color: kBorderColor)),
                    MyText(text: 'or', color: kQuaternaryColor),
                    Expanded(child: Container(height: 1, color: kBorderColor)),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  spacing: 10,
                  children: List.generate(
                    3,
                    (i) => Expanded(
                      child: Image.asset(
                        [
                          Assets.imagesGoogle,
                          Assets.imagesApple,
                          Assets.imagesFacebook,
                        ][i],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Don't have an account? ",
                  size: 12,
                  weight: FontWeight.w400,
                ),
                MyText(
                  text: 'Create Account',
                  size: 12,
                  color: kSecondaryColor,
                  weight: FontWeight.w500,
                  onTap: () {
                    Get.to(() => SignUp());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
