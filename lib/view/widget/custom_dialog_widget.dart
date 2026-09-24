import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/view/widget/my_button_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.child,
    this.buttonText,
    this.onTap,
    this.actionButtons,
  });
  final String? image;
  final String? title;
  final String? subTitle;
  final String? buttonText;
  final VoidCallback? onTap;
  final Widget? child;
  final Widget? actionButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child:
                child ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(image ?? '', height: 100),
                    MyText(
                      text: title ?? '',
                      size: 22,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      paddingTop: 20,
                    ),
                    MyText(
                      paddingTop: 8,
                      text: subTitle ?? '',
                      color: kQuaternaryColor,
                      textAlign: TextAlign.center,
                      lineHeight: 1.5,
                      weight: FontWeight.w500,
                      paddingBottom: 30,
                    ),
                    actionButtons ??
                        MyButton(
                          buttonText: buttonText ?? '',
                          onTap: onTap ?? () {},
                        ),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}
