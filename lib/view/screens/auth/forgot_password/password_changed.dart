import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(Assets.imagesLogo, height: 120),
            MyText(
              text: "You're All Set!",
              size: 32,
              textAlign: TextAlign.center,
              paddingTop: 38,
              weight: FontWeight.bold,
            ),
            MyText(
              text:
                  "Congratulations! Your password has been successfully changed!",
              size: 18,
              lineHeight: 1.5,
              color: kGreyColor,
              textAlign: TextAlign.center,
              paddingTop: 30,
            ),
            Spacer(),
            MyButton(buttonText: 'Go to HomePage', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
