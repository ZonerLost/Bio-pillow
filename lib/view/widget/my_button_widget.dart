import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.bgColor,
    this.textColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  FontWeight? weight;
  Widget? customChild;
  Color? bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        color: bgColor ?? kSecondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withValues(alpha: 0.1),
          highlightColor: kPrimaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 10),
          child:
              customChild ??
              Center(
                child: MyText(
                  text: buttonText,
                  size: textSize ?? 16,
                  weight: weight ?? FontWeight.w500,
                  color: textColor ?? kPrimaryColor,
                ),
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.bgColor,
    this.textColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  FontWeight? weight;
  Widget? customChild;
  Color? bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        color: bgColor ?? kSecondaryColor.withValues(alpha: 0.2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withValues(alpha: 0.1),
          highlightColor: kPrimaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 10),
          child:
              customChild ??
              Center(
                child: MyText(
                  text: buttonText,
                  size: textSize ?? 16,
                  weight: weight ?? FontWeight.w500,
                  color: textColor ?? kSecondaryColor,
                ),
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyToggleButton extends StatelessWidget {
  MyToggleButton({
    required this.buttonText,
    required this.onTap,
    required this.isSelected,
  });

  final String buttonText;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? kSecondaryColor : Colors.transparent,
        border: Border.all(width: 1.0, color: kSecondaryColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor:
              isSelected
                  ? kPrimaryColor.withOpacity(0.1)
                  : kSecondaryColor.withOpacity(0.1),
          highlightColor:
              isSelected
                  ? kPrimaryColor.withOpacity(0.1)
                  : kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
          child: Center(
            child: MyText(
              text: buttonText,
              size: 14,
              lineHeight: null,
              weight: FontWeight.w600,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
