import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/auth/forgot_password/otp_verification.dart';
import 'package:bio_pillow/view/screens/auth/login/login.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_dialog_widget.dart';
import 'package:bio_pillow/view/widget/heading_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_field_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
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
                  title: 'Change Password',
                  subTitle: 'Please change password to ensure proper security',
                ),
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
                  hintText: 'Confirm Password',
                  isObSecure: true,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesVisibility, height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Change Password',
              onTap: () {
                Get.dialog(
                  CustomDialog(
                    image: Assets.imagesSuccess,
                    buttonText: 'Login',
                    title: 'Password Changed',
                    subTitle:
                        'Your password has been changed successfully. You can now login with your new password.',
                    onTap: () {
                      Get.offAll(() => Login());
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
