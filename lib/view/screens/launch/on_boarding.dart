import 'dart:developer';
import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/launch/main_focus.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _items = [
      {
        'title': 'Welcome to Bio Pillow',
        'bg': Assets.imagesOn1,
        'subtitle':
            'Experience smarter sleep tracking and personalized insights. Bio Pillow helps you monitor your sleep patterns effortlessly.',
      },
      {
        'title': 'Track & Improve Your Sleep',
        'bg': Assets.imagesOn2,
        'subtitle':
            'Set goals, analyze your sleep quality, and get tips to improve your rest. Bio Pillow is your companion for better nights.',
      },
      {
        'title': 'Wake Up Refreshed',
        'bg': Assets.imagesOn3,
        'subtitle':
            'Enjoy gentle smart alarms and daily reports. Bio Pillow supports your journey to healthier, more restful sleep.',
      },
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    log(currentIndex.toString());
                  });
                },
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        _items[index]['bg'],
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => MainFocus());
                          },
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyText(
                                text: 'Skip',
                                size: 16,
                                weight: FontWeight.w500,
                                color: kTertiaryColor,
                              ),
                              Image.asset(
                                Assets.imagesSkipArrow,
                                height: 20,
                                color: kTertiaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SmoothPageIndicator(
                controller: controller,
                count: _items.length,
                effect: ExpandingDotsEffect(
                  dotColor: kBorderColor2,
                  activeDotColor: kSecondaryColor,
                  dotHeight: 8,
                  spacing: 7.0,
                  expansionFactor: 4.0,
                  dotWidth: 8,
                ),
                onDotClicked: (index) {},
              ),
            ),
          ),
          MyText(
            text: _items[currentIndex]['title'],
            size: 20,
            paddingLeft: 20,
            paddingRight: 20,
            lineHeight: 1.5,
            color: kTertiaryColor,
            textAlign: TextAlign.center,
            weight: FontWeight.w600,
          ),
          MyText(
            paddingLeft: 20,
            paddingRight: 20,
            paddingTop: 10,
            text: _items[currentIndex]['subtitle'],
            size: 14,
            lineHeight: 1.5,
            color: kQuaternaryColor,
            textAlign: TextAlign.center,
            paddingBottom: 30,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: MyButton(
          buttonText: '',
          customChild: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: currentIndex == 2 ? 'Get Started' : 'Next',
                size: 16,
                weight: FontWeight.w500,
                color: kPrimaryColor,
              ),
              if (currentIndex == 2)
                Image.asset(
                  Assets.imagesSkipArrow,
                  height: 20,
                  color: kPrimaryColor,
                ),
            ],
          ),
          onTap: () {
            currentIndex == 2
                ? Get.to(() => MainFocus())
                : controller.nextPage(
                  duration: 220.milliseconds,
                  curve: Curves.easeIn,
                );
          },
        ),
      ),
    );
  }
}
