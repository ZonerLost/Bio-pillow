import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.bgColor,
    this.marginBottom,
    this.width,
    this.labelText,
    this.hintColor,
    this.radius,
    this.border,
    this.height,
  });

  final List<dynamic>? items;
  String selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String hint;
  String? labelText;
  double? radius;
  double? border;
  Color? bgColor;
  Color? hintColor;
  double? marginBottom, width, height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              size: 12,
              color: kBlackColor,
              paddingBottom: 6,
              weight: FontWeight.bold,
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              items:
                  items!
                      .map(
                        (item) => DropdownMenuItem<dynamic>(
                          value: item,
                          child: MyText(text: item, size: 14),
                        ),
                      )
                      .toList(),
              value: selectedValue,
              onChanged: onChanged,
              iconStyleData: IconStyleData(icon: SizedBox()),
              isDense: true,
              isExpanded: false,
              customButton: Container(
                height: height ?? 48,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: bgColor ?? kFillColor,
                  borderRadius: BorderRadius.circular(radius ?? 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        text: selectedValue == hint ? hint : selectedValue,
                        size: 14,
                        weight: FontWeight.w500,
                        color:
                            selectedValue == hint
                                ? kQuaternaryColor
                                : kTertiaryColor,
                      ),
                    ),
                    Image.asset(Assets.imagesDropdown, height: 16),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(height: 35),
              dropdownStyleData: DropdownStyleData(
                elevation: 3,
                maxHeight: 300,
                offset: Offset(0, -5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
