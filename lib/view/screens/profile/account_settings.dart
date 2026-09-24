import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/profile/change_password.dart';
import 'package:bio_pillow/view/screens/profile/profile.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/route_manager.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Account Settings'),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(child: MyText(text: 'Login Email')),
                    MyText(
                      text: 'example@email.com',
                      size: 12,
                      color: kQuaternaryColor,
                    ),
                  ],
                ),
                ProfileTile(
                  title: 'Change Password',
                  onTap: () {
                    Get.to(() => ChangePassword());
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(child: MyText(text: 'Save Account Data')),
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
          ),
        ],
      ),
    );
  }
}
