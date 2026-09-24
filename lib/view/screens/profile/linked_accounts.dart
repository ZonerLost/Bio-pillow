import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/custom_app_bar.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class LinkedAccounts extends StatefulWidget {
  const LinkedAccounts({super.key});

  @override
  State<LinkedAccounts> createState() => _LinkedAccountsState();
}

class _LinkedAccountsState extends State<LinkedAccounts> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Linked Accounts',
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEditMode = !isEditMode;
                });
              },
              child: Image.asset(Assets.imagesEditIcon, height: 32),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          final linkedAccounts = [
            {'icon': Assets.imagesGoogleAccount, 'title': 'example@email.com'},
            {'icon': Assets.imagesFacebookAccount, 'title': '/jhondoe'},
          ];
          return Row(
            spacing: isEditMode ? 10 : 0,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        linkedAccounts[index]['icon'] ?? '',
                        height: 24,
                      ),
                      Expanded(
                        child: MyText(
                          paddingLeft: 10,
                          text: linkedAccounts[index]['title'] ?? '',
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isEditMode
                  ? Image.asset(Assets.imagesDelete, height: 48)
                  : SizedBox(),
            ],
          );
        },
      ),
      bottomNavigationBar:
          isEditMode
              ? Padding(
                padding: AppSizes.DEFAULT,
                child: MyButton(
                  buttonText: 'Save',
                  onTap: () {
                    setState(() {
                      isEditMode = false;
                    });
                  },
                ),
              )
              : null,
    );
  }
}
