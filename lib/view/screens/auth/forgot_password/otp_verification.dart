import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_fonts.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/auth/forgot_password/create_new_password.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_dialog_widget.dart';
import 'package:bio_pillow/view/widget/heading_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DEFAULT_THEME = PinTheme(
      width: 80,
      height: 70,
      margin: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 20,
        height: 0.0,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
        fontFamily: AppFonts.Poppins,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kFillColor,
      ),
    );
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
                  title: 'Verify Code',
                  subTitle:
                      'Enter the code sent to your email to change your password',
                ),
                SizedBox(height: 10),
                Pinput(
                  length: 4,
                  onChanged: (value) {},
                  pinContentAlignment: Alignment.center,
                  defaultPinTheme: DEFAULT_THEME,
                  focusedPinTheme: DEFAULT_THEME.copyWith(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.0, color: kSecondaryColor),
                      color: kFillColor,
                    ),
                  ),
                  submittedPinTheme: DEFAULT_THEME.copyWith(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.0, color: kSecondaryColor),
                      color: kFillColor,
                    ),
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                  separatorBuilder: (index) {
                    return SizedBox(width: 20);
                  },
                  onCompleted: (pin) => print(pin),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    MyText(text: '00:30 ', size: 14),
                    MyText(text: 'Resend Code', color: kSecondaryColor),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Verify Code',
              onTap: () {
                Get.dialog(
                    CustomDialog(
                    image: Assets.imagesSuccess,
                    buttonText: 'Change Password',
                    title: 'Code Verified',
                    subTitle:
                      'Your account has been verified by the code. You can proceed with changing password',
                    onTap: () {
                      Get.back();
                      Get.to(() => CreateNewPassword());
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
