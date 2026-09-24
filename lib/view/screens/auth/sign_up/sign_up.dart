import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/heading_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_field_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  title: 'Create Account',
                  subTitle:
                      'Provide the following information to create a new account',
                ),
                MyTextField(hintText: 'Jhon Doe'),
                MyTextField(hintText: 'example@email.com'),
                MyTextField(
                  hintText: 'Password',
                  isObSecure: true,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesVisibility, height: 20),
                    ],
                  ),
                ),
                MyTextField(
                  marginBottom: 30,
                  hintText: 'Confirm Password',
                  isObSecure: true,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesVisibility, height: 20),
                    ],
                  ),
                ),

                MyButton(
                  buttonText: 'Create Account',
                  onTap: () {
                    // Get.to(() => BottomNavBar());
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
                  text: "Already have an account? ",
                  size: 12,
                  weight: FontWeight.w400,
                ),
                MyText(
                  text: 'Login',
                  size: 12,
                  color: kSecondaryColor,
                  weight: FontWeight.w500,
                  onTap: () {
                    Get.back();
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
