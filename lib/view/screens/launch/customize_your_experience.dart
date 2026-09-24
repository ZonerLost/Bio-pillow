import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/auth/login/login.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_drop_down_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class CustomizeYourExperience extends StatefulWidget {
  const CustomizeYourExperience({super.key});

  @override
  State<CustomizeYourExperience> createState() =>
      _CustomizeYourExperienceState();
}

class _CustomizeYourExperienceState extends State<CustomizeYourExperience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  text: "Customize your experience",
                  size: 18,
                  weight: FontWeight.w600,
                  lineHeight: 1.5,
                  color: kTertiaryColor,
                  paddingBottom: 8,
                ),
                MyText(
                  text:
                      "Choose the session styles and features you enjoy most.",
                  size: 14,
                  color: kQuaternaryColor,
                  paddingBottom: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Vibration Feedback',
                        weight: FontWeight.w500,
                      ),
                    ),
                    FlutterSwitch(
                      value: true,
                      onToggle: (v) {},
                      activeColor: kSecondaryColor,
                      inactiveColor: kFillColor,
                      toggleColor: kTertiaryColor,
                      width: 64,
                      height: 28,
                      toggleSize: 24,
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Preferred Music',
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomDropDown(
                        height: 44,
                        marginBottom: 0,

                        hint: 'Nature Sound',
                        items: ['Nature Sound'],
                        selectedValue: 'Nature Sound',
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Ideal Session',
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomDropDown(
                        height: 44,
                        marginBottom: 0,

                        hint: '5 min',
                        items: ['5 min'],
                        selectedValue: '5 min',
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(
              buttonText: '',
              customChild: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Login',
                    size: 16,
                    weight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),

                  Image.asset(
                    Assets.imagesSkipArrow,
                    height: 20,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(() => Login());
              },
            ),
            SizedBox(height: 10),
            MyButton(
              buttonText: 'Back',
              onTap: () {
                Get.back();
              },
              bgColor: kPrimaryColor,
              textColor: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
