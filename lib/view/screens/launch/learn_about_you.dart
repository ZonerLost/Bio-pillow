import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/view/screens/launch/customize_your_experience.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LearnAboutYou extends StatefulWidget {
  const LearnAboutYou({super.key});

  @override
  State<LearnAboutYou> createState() => _LearnAboutYouState();
}

class _LearnAboutYouState extends State<LearnAboutYou> {
  final List<Map<String, dynamic>> items = [
    {
      'question': 'How would you rate your sleep quality?',
      'answers': ['Poor', 'Moderate', 'Excellent'],
    },
    {
      'question': 'How active are you during the day?',
      'answers': ['Low', 'Moderate', 'High'],
    },
    {
      'question': 'Do you follow a daily routine?',
      'answers': ['No', 'Yes'],
    },
  ];

  // Selected answer per question (questionIndex -> answerIndex)
  final Map<int, int> selectedAnswers = {};

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
                  text: "Let’s Learn About You",
                  size: 18,
                  weight: FontWeight.w600,
                  lineHeight: 1.5,
                  color: kTertiaryColor,
                  paddingBottom: 8,
                ),
                MyText(
                  text:
                      "Share your daily habits to help us personalize your sessions.",
                  size: 14,
                  color: kQuaternaryColor,
                  paddingBottom: 14,
                ),
                // Render each question and its answer options
                ...items.asMap().entries.expand((entry) {
                  final int qIndex = entry.key;
                  final Map<String, dynamic> item = entry.value;
                  final String question = item['question'] as String? ?? '';
                  final List<dynamic> answers =
                      item['answers'] as List<dynamic>? ?? [];

                  // Build a list: question header + its answers
                  return [
                    MyText(
                      text: question,
                      size: 16,
                      weight: FontWeight.w600,
                      paddingTop: 14,
                      paddingBottom: 10,
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        ...answers.asMap().entries.map((aEntry) {
                          final int aIndex = aEntry.key;
                          final String answerTitle =
                              aEntry.value?.toString() ?? '';
                          return _CustomTile(
                            icon:
                                [
                                  Assets.imagesPoor,
                                  Assets.imagesModerate,
                                  Assets.imagesHigh,
                                ][aIndex],
                            title: answerTitle,
                            isSelected: selectedAnswers[qIndex] == aIndex,
                            onTap: () {
                              setState(() {
                                // toggle selection: selecting same twice will unselect
                                if (selectedAnswers[qIndex] == aIndex) {
                                  selectedAnswers.remove(qIndex);
                                } else {
                                  selectedAnswers[qIndex] = aIndex;
                                }
                              });
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ];
                }).toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(
              buttonText: 'Next',
              onTap: () {
                Get.to(() => CustomizeYourExperience());
              },
            ),
            SizedBox(height: 10),
            MyButton(
              buttonText: 'Back',
              onTap: () {
                Get.back();
              },
              bgColor: kPrimaryColor,
              textColor: kSecondaryColor,
            ),
          ],
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kFillColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: 16,
              width: 16,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
            MyText(
              paddingLeft: 6,
              paddingRight: 6,
              text: title,
              size: 12,
              weight: FontWeight.w500,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
