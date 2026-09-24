import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/auth/forgot_password/otp_verification.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_dialog_widget.dart';
import 'package:bio_pillow/view/widget/heading_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_field_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                  title: 'Verify Email',
                  subTitle: 'Confirm your email to reset your password',
                ),
                MyTextField(hintText: 'example@email.com', marginBottom: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Image.asset(Assets.imagesInfo, height: 18),
                    Expanded(
                      child: MyText(
                        size: 11,
                        text:
                            "You will be sent a temporary 4-digit code over your email that can be used to change your password",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Send Code',
              onTap: () {
                Get.dialog(
                  CustomDialog(
                    image: Assets.imagesSuccess,
                    buttonText: 'Enter Code',
                    title: 'Code Sent',
                    subTitle:
                        'Code sent to your email. Please check your email to provide code',
                    onTap: () {
                      Get.to(() => OtpVerification());
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
