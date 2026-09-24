import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Playback extends StatelessWidget {
  const Playback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: simpleAppBar(title: 'Better Sleep', bgColor: Colors.transparent),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: AppSizes.DEFAULT,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesPlayBackBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Center(
                      child: CommonImageView(
                        height: 200,
                        width: Get.width,
                        radius: 14,
                        url: dummyImg,
                      ),
                    ),
                  ),
                  MyText(
                    paddingTop: 14,
                    text: 'Lullaby Zzz',
                    size: 18,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2),
                  MyText(
                    text: 'Alex benjamin',
                    size: 12,
                    color: kQuaternaryColor,
                    textAlign: TextAlign.center,
                    paddingBottom: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kFillColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Session from',
                          size: 12,
                          color: kSecondaryColor,
                          paddingBottom: 6,
                        ),
                        MyText(
                          text: 'Better Sleep',
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        Container(
                          height: 1,
                          color: kSecondaryColor,
                          margin: EdgeInsets.symmetric(vertical: 12),
                        ),
                        MyText(
                          text: 'Session purpose',
                          size: 12,
                          color: kSecondaryColor,
                          paddingBottom: 6,
                        ),
                        MyText(
                          text: 'Calm music to relax brain and help sleep',
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 12,
              children: [
                MyText(text: '00:00', size: 12, color: kQuaternaryColor),
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.3,
                    borderRadius: BorderRadius.circular(50),
                    backgroundColor: kTertiaryColor.withValues(alpha: 0.2),
                    minHeight: 8,
                    valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                  ),
                ),
                MyText(text: '30:00', size: 12, color: kQuaternaryColor),
              ],
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Image.asset(Assets.imagesPrevious, height: 38),
                Image.asset(Assets.imagesPauseIcon, height: 60),
                Image.asset(Assets.imagesNext, height: 38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
