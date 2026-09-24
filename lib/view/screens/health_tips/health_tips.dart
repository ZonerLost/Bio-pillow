import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
// import 'package:bio_pillow/constants/app_images.dart'; // not used
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HealthTips extends StatefulWidget {
  const HealthTips({super.key});

  @override
  State<HealthTips> createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          spacing: 10,
          children: [
            CommonImageView(height: 40, width: 40, radius: 8, url: dummyImg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Welcome Back!',
                    size: 12,
                    color: kQuaternaryColor,
                  ),
                  MyText(text: 'Jhon Doe', size: 16, weight: FontWeight.w600),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: kFillColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: MyText(
                text: '07/08/2025',
                color: kSecondaryColor,
                size: 12,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
          MyText(
            text: 'Practice the following habits for your wellness',
            size: 18,
            weight: FontWeight.w600,
            lineHeight: 1.5,
            color: kTertiaryColor,
            paddingBottom: 8,
          ),
          MyText(
            text:
                "Keep you mental health up to speed and follow a few tips daily",
            size: 14,
            color: kQuaternaryColor,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
                  _CircularImage(
                    radius: 200,
                    text: 'Sleep Early',
                    image: Assets.imagesSleepEarly,
                    textSize: 16,
                    paddingBottom: 20,
                  ),
                  _CircularImage(
                    radius: 180,
                    text: 'Workout',
                    image: Assets.imagesWorkout,
                    textSize: 16,
                    paddingBottom: 30,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _CircularImage(
                      radius: 150,
                      text: 'Touch\nGrass',
                      image: Assets.imagesTouchGrass,
                      textSize: 12,
                      paddingBottom: 30,
                    ),
                    _CircularImage(
                      radius: 110,
                      paddingBottom: 16,
                      textSize: 12,
                      text: 'Treat\nYourself',
                      image: Assets.imagesTreatYourself,
                    ),
                    _CircularImage(
                      radius: 160,
                      text: 'Meet New\nPeople',
                      image: Assets.imagesMeetNew,
                      textSize: 16,
                      paddingBottom: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircularImage extends StatefulWidget {
  const _CircularImage({
    required this.text,
    required this.image,
    required this.radius,
    required this.textSize,
    required this.paddingBottom,
  });

  final double radius;
  final double textSize;
  final double paddingBottom;
  final String text;
  final String image;

  @override
  State<_CircularImage> createState() => _CircularImageState();
}

class _CircularImageState extends State<_CircularImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Stack(
        children: [
          CommonImageView(
            height: widget.radius,
            width: widget.radius,
            imagePath: widget.image,
            radius: 100,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: widget.paddingBottom,
            child: Center(
              child: MyText(
                text: widget.text,
                size: widget.textSize,
                color: kTertiaryColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
