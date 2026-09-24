import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class WellnessProgram extends StatefulWidget {
  const WellnessProgram({super.key});

  @override
  State<WellnessProgram> createState() => _WellnessProgramState();
}

class _WellnessProgramState extends State<WellnessProgram> {
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
            text: 'Wellness Programs',
            size: 18,
            weight: FontWeight.w600,
            lineHeight: 1.5,
            color: kTertiaryColor,
            paddingBottom: 8,
          ),
          MyText(
            text:
                "Go through these challenges to improve your mental stability",
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
            Image.asset(
              Assets.imagesArrowNext,
              height: 20,
              color: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
