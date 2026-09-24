import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  String? title,
  Widget? leadingWidget,
  bool? centerTitle = false,
  List<Widget>? actions,
  Color? bgColor,
}) {
  return AppBar(
    backgroundColor: bgColor,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    titleSpacing: 10.0,
    leading:
        haveLeading
            ? leadingWidget ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          Assets.imagesArrowBackRounded,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                )
            : null,
    title: MyText(text: title ?? '', size: 18, weight: FontWeight.w500),
    actions: actions,
  );
}

AppBar logoAppBar() {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Image.asset(Assets.imagesLogoSimple, height: 32),
  );
}
