import 'package:flutter/cupertino.dart';
import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool? value;
  final Function(bool)? onChanged;

  const CustomSwitchTile({
    required this.title,
    this.value = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MyText(text: title, weight: FontWeight.w700, size: 16)),
        SizedBox(
          height: 25,
          child: Transform.scale(
            scale: 0.62,
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 25 / 0.62,
              width: 25 / 0.62,
              child: CupertinoSwitch(
                activeTrackColor: kSecondaryColor,
                value: value!,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
