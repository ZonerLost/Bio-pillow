import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/custom_check_box_widget.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int selectedIndex = 0;

  final List<Map<String, String>> languages = [
    {'title': 'English (UK)'},
    {'title': 'English (US)'},
    {'title': 'Arabic'},
    {'title': 'Bulgarian'},
    {'title': 'Dutch'},
    {'title': 'Finish'},
    {'title': 'German'},
    {'title': 'Hungarian'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Languages'),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: kTertiaryColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: languages[index]['title'] ?? '',
                        size: 14,
                      ),
                    ),
                    CustomCheckBox(
                      isActive: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      radius: 100,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
