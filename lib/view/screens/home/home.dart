import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_fonts.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/screens/home/music_list.dart';
import 'package:bio_pillow/view/screens/home/playback.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                snap: false,
                titleSpacing: 20,
                title: Row(
                  spacing: 10,
                  children: [
                    CommonImageView(
                      height: 40,
                      width: 40,
                      radius: 8,
                      url: dummyImg,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Welcome Back!',
                            size: 12,
                            color: kSecondaryColor,
                          ),
                          MyText(
                            text: 'Jhon Doe',
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          _ConnectDevice(),
                          isScrollControlled: true,
                        );
                      },
                      child: Image.asset(Assets.imagesBluetooth, height: 32),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: AppSizes.DEFAULT,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: AppFonts.Poppins,
                                  fontWeight: FontWeight.w600,
                                  color: kTertiaryColor,
                                ),
                                children: [
                                  TextSpan(text: 'Hi Jhon! '),
                                  TextSpan(text: 'Hope you\nhad a '),
                                  TextSpan(
                                    text: ' good ',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      backgroundColor: Color(
                                        0xffB6A3F2,
                                      ).withValues(alpha: 0.6),
                                    ),
                                  ),
                                  TextSpan(text: ' day'),
                                ],
                              ),
                            ),
                            Positioned(
                              child: Image.asset(Assets.imagesHi, height: 20),
                              top: -10,
                              left: -18,
                            ),
                            Positioned(
                              child: Image.asset(
                                Assets.imagesGoodDay,
                                height: 25,
                              ),
                              bottom: -14,
                              right: -18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    MyText(
                      paddingLeft: 20,
                      paddingRight: 20,
                      text: 'Wellness Programs',
                      size: 18,
                      weight: FontWeight.w600,
                      lineHeight: 1.5,
                      color: kTertiaryColor,
                      paddingBottom: 8,
                    ),
                    MyText(
                      paddingLeft: 20,
                      paddingRight: 20,
                      text:
                          "Go through these challenges to improve your mental stability",
                      size: 14,
                      color: kQuaternaryColor,
                      paddingBottom: 10,
                    ),
                    _Heading(title: 'Better Sleep', onShowAllTap: () {}),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: AppSizes.HORIZONTAL,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 150,
                                  height: Get.height,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonImageView(
                                        width: 150,
                                        height: 120,
                                        radius: 10,
                                        url: dummyImg,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 8),
                                      MyText(
                                        text: 'Lullaby Zzz',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                      MyText(
                                        size: 12,
                                        paddingTop: 4,
                                        text: 'Alex benjamin',
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              CommonImageView(
                                width: 150,
                                height: 120,
                                radius: 10,
                                imagePath: Assets.imagesMusicPlaceholder,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    _Heading(title: 'Reduce Stress', onShowAllTap: () {}),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: AppSizes.HORIZONTAL,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 150,
                                  height: Get.height,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonImageView(
                                        width: 150,
                                        height: 120,
                                        radius: 10,
                                        url: dummyImg,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 8),
                                      MyText(
                                        text: 'Lullaby Zzz',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                      MyText(
                                        size: 12,
                                        paddingTop: 4,
                                        text: 'Alex benjamin',
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              CommonImageView(
                                width: 150,
                                height: 120,
                                radius: 10,
                                imagePath: Assets.imagesMusicPlaceholder,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    _Heading(title: 'Improve Focus', onShowAllTap: () {}),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: AppSizes.HORIZONTAL,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 150,
                                  height: Get.height,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonImageView(
                                        width: 150,
                                        height: 120,
                                        radius: 10,
                                        url: dummyImg,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 8),
                                      MyText(
                                        text: 'Lullaby Zzz',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                      MyText(
                                        size: 12,
                                        paddingTop: 4,
                                        text: 'Alex benjamin',
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              CommonImageView(
                                width: 150,
                                height: 120,
                                radius: 10,
                                imagePath: Assets.imagesMusicPlaceholder,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    _Heading(title: 'Overall Wellness', onShowAllTap: () {}),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: AppSizes.HORIZONTAL,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 150,
                                  height: Get.height,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonImageView(
                                        width: 150,
                                        height: 120,
                                        radius: 10,
                                        url: dummyImg,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 8),
                                      MyText(
                                        text: 'Lullaby Zzz',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                      MyText(
                                        size: 12,
                                        paddingTop: 4,
                                        text: 'Alex benjamin',
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              CommonImageView(
                                width: 150,
                                height: 120,
                                radius: 10,
                                imagePath: Assets.imagesMusicPlaceholder,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 10,
                right: 15,
                left: 15,
                child: CurrentlyPlaying(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentlyPlaying extends StatefulWidget {
  const CurrentlyPlaying({super.key});

  @override
  State<CurrentlyPlaying> createState() => _CurrentlyPlayingState();
}

class _CurrentlyPlayingState extends State<CurrentlyPlaying>
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
    return GestureDetector(
      onTap: () {
        Get.to(() => Playback());
      },
      child: Container(
        padding: EdgeInsets.all(6),
        width: Get.width,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withValues(alpha: 0.16),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            RotationTransition(
              turns: _controller,
              child: CommonImageView(
                height: 40,
                width: 40,
                radius: 100,
                url: dummyImg,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Alex benjamin',
                    size: 10,
                    color: kQuaternaryColor,
                  ),
                  MyText(
                    text: 'Lullaby Zzz',
                    size: 12,
                    weight: FontWeight.w500,
                    paddingBottom: 6,
                  ),
                  LinearProgressIndicator(
                    value: 0.3,
                    borderRadius: BorderRadius.circular(50),
                    backgroundColor: kFillColor,
                    minHeight: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kFillColor,
              ),
              child: Center(child: Image.asset(Assets.imagesPause, height: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConnectDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.65,
      padding: AppSizes.HORIZONTAL,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              height: 6,
              width: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kTertiaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  paddingTop: 10,
                  text: 'Connect to your Pillow',
                  size: 18,
                  weight: FontWeight.w600,
                  lineHeight: 1.5,
                  color: kTertiaryColor,
                  paddingBottom: 8,
                ),
                MyText(
                  text:
                      "Search through the list of devices and select the pillow to connect through bluetooth",
                  size: 14,
                  color: kQuaternaryColor,
                  paddingBottom: 20,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({required this.title, required this.onShowAllTap});
  final String title;
  final VoidCallback onShowAllTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: MyText(text: title, size: 16, weight: FontWeight.w500),
          ),
          MyText(
            onTap: () {
              Get.to(() => MusicList());
            },
            // onTap: onShowAllTap,
            text: 'Show all',
            weight: FontWeight.w500,
            color: kSecondaryColor,
          ),
        ],
      ),
    );
  }
}
