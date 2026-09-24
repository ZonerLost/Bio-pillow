import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/profile/change_password.dart';
import 'package:bio_pillow/view/screens/profile/profile.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/route_manager.dart';

class DataBackup extends StatelessWidget {
  const DataBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Data Backup'),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(child: MyText(text: 'Data Backup')),
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
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kFillColor,
              border: Border.all(width: 1.0, color: kSecondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MyText(text: 'example@email.com', color: kSecondaryColor),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: MyButton(buttonText: 'Save', onTap: () {}),
      ),
    );
  }
}
