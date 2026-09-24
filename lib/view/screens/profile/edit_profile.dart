import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_field_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Edit Profile'),
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
          MyTextField(hintText: 'Username'),
          MyTextField(hintText: 'D.O.B'),
          MyTextField(hintText: 'Email'),
          MyTextField(hintText: 'Phone Number'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: MyButton(buttonText: 'Save', onTap: () {}),
      ),
    );
  }
}
