import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/screens/profile/edit_profile.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Profile Settings',
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                Get.to(() => EditProfile());
              },
              child: Image.asset(Assets.imagesEditIcon, height: 32),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: CommonImageView(
              height: 100,
              width: 100,
              radius: 100,
              url: dummyImg,
            ),
          ),
          MyText(
            paddingTop: 10,
            text: 'Jhon Doe',
            size: 16,
            weight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2),
          MyText(
            text: 'example@email.com',
            size: 12,
            color: kQuaternaryColor,
            textAlign: TextAlign.center,
            paddingBottom: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(5, (index) {
                  final fields = [
                    {'label': 'Full Name', 'value': 'Jhon Doe'},
                    {'label': 'D.O.B', 'value': '02/02/1999'},
                    {'label': 'Email', 'value': 'example@email.com'},
                    {'label': 'Phone Number', 'value': '+1 (000) 000 0000'},
                  ];
                  if (index >= fields.length) return SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: fields[index]['label']!,
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ),
                        MyText(
                          text: fields[index]['value']!,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
