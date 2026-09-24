import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/screens/home/home.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Better Sleep'),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text: 'Better Sleep',
                size: 16,
                weight: FontWeight.w500,
                paddingBottom: 12,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 20,
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Stack(
                        children: [
                          CommonImageView(
                            width: 50,
                            height: 50,
                            radius: 6,
                            url: dummyImg,
                            fit: BoxFit.cover,
                          ),
                          CommonImageView(
                            width: 50,
                            height: 50,
                            radius: 6,
                            imagePath: Assets.imagesMusic,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                      MyText(size: 12, text: '30:00', color: kQuaternaryColor),
                    ],
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 15,
            left: 15,
            child: CurrentlyPlaying(),
          ),
        ],
      ),
    );
  }
}
