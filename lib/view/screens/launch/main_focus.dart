import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/launch/learn_about_you.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFocus extends StatefulWidget {
  const MainFocus({super.key});

  @override
  State<MainFocus> createState() => _MainFocusState();
}

class _MainFocusState extends State<MainFocus> {
  // Options for the single question screen
  final List<Map<String, String>> answers = [
    {'title': 'Better Sleep', 'icon': Assets.imagesBetterSleep},
    {'title': 'Reduce Stress', 'icon': Assets.imagesReduceStress},
    {'title': 'Improve Focus', 'icon': Assets.imagesImproveFocus},
    {'title': 'Overall Wellness', 'icon': Assets.imagesOverAllWellness},
  ];

  // Selected answer indices (allows multiple selection; switch to int for single selection)
  final Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'What’s Your Main Focus?',
                  size: 18,
                  weight: FontWeight.w600,
                  lineHeight: 1.5,
                  color: kTertiaryColor,
                  paddingBottom: 8,
                ),
                MyText(
                  text:
                      "Tell us what you’d like to improve so we can tailor your experience.",
                  size: 14,
                  color: kQuaternaryColor,
                  paddingBottom: 30,
                ),
                ...answers.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final Map<String, String> ans = entry.value;
                  final String title = ans['title'] ?? '';
                  final String icon = ans['icon'] ?? '';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _CustomTile(
                      icon: icon,
                      title: title,
                      isSelected: selected.contains(index),
                      onTap: () {
                        setState(() {
                          if (selected.contains(index)) {
                            selected.remove(index);
                          } else {
                            selected.add(index);
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: MyButton(
          buttonText: 'Next',
          onTap: () {
            Get.to(() => LearnAboutYou());
          },
        ),
      ),
    );
  }
}

class _CustomTile extends StatelessWidget {
  const _CustomTile({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kFillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 24,
              width: 24,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
            Expanded(
              child: MyText(
                paddingLeft: 12,
                text: title,
                size: 16,
                weight: FontWeight.w500,
                color: isSelected ? kPrimaryColor : kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
