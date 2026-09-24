import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.marginTop,
  });
  final String? title;
  final String? subTitle;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          paddingTop: marginTop ?? 0,
          text: title ?? '',
          size: 22,
          paddingBottom: 10,
          weight: FontWeight.w700,
        ),
        if (subTitle!.isNotEmpty)
          MyText(
            text: subTitle ?? '',
            size: 14,
            lineHeight: 1.5,
            paddingBottom: 30,
            color: kQuaternaryColor,
          ),
      ],
    );
  }
}
