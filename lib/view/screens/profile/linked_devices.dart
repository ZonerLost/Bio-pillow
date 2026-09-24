import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/profile/change_password.dart';
import 'package:bio_pillow/view/screens/profile/profile.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/route_manager.dart';

class LinkedDevices extends StatelessWidget {
  const LinkedDevices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Linked Devices'),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: 10,
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kFillColor,
              border: Border.all(width: 1.0, color: kSecondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(Assets.imagesBlueTooth, height: 20),
                Expanded(
                  child: MyText(
                    paddingLeft: 10,
                    text: 'example@email.com',
                    color: kSecondaryColor,
                  ),
                ),
                Image.asset(Assets.imagesMore, height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
