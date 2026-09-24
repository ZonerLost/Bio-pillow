import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines = 1,
    this.labelSize,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.fillColor = kFillColor,
    this.onTap,
  }) : super(key: key);

  String? labelText, hintText;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure, isReadOnly;
  double? marginBottom;
  int? maxLines;
  Color? fillColor;
  double? labelSize;
  Widget? prefix, suffix;
  final VoidCallback? onTap;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (mounted) {
        setState(() {
          isFocused = _focusNode.hasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.labelText != null)
            MyText(
              text: widget.labelText ?? '',
              size: widget.labelSize ?? 12,
              color: kTertiaryColor,
              paddingBottom: 6,
              weight: FontWeight.bold,
            ),
          // Use a dedicated FocusNode so focus state updates reliably
          TextFormField(
            focusNode: _focusNode,
            onTap: widget.onTap,
            textAlignVertical:
                widget.prefix != null || widget.suffix != null
                    ? TextAlignVertical.center
                    : null,
            cursorColor: kSecondaryColor,
            maxLines: widget.maxLines,
            readOnly: widget.isReadOnly ?? false,
            controller: widget.controller,
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.next,
            obscureText: widget.isObSecure!,
            obscuringCharacter: '*',
            style: TextStyle(
              fontSize: 14,
              color: isFocused ? kSecondaryColor : kQuaternaryColor,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: widget.maxLines! > 1 ? 15 : 0,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kQuaternaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kSecondaryColor, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class PhoneField extends StatefulWidget {
  PhoneField({
    Key? key,
    this.controller,
    this.onChanged,
    this.marginBottom = 16.0,
  }) : super(key: key);

  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  double? marginBottom;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String countryFlag = '🇺🇸';
  String countryCode = '1';
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Phone Number',
            size: 12,
            color: kBlackColor,
            paddingBottom: 6,
            weight: FontWeight.bold,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              cursorColor: kQuaternaryColor,
              controller: widget.controller,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kBlackColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: kBorderColor,
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          MyText(
                            paddingLeft: 10,
                            paddingRight: 10,
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: kPrimaryColor,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: kBlackColor,
                                    // fontFamily: AppFonts.URBANIST,
                                  ),
                                  bottomSheetHeight: 500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  searchTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w500,
                                    // fontFamily: AppFonts.URBANIST,
                                  ),
                                  inputDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    fillColor: kBorderColor,
                                    filled: true,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: kQuaternaryColor,
                                      // fontFamily: AppFonts.i,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBorderColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBorderColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBorderColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) {
                                  setState(() {
                                    countryFlag = country.flagEmoji;
                                    countryCode = country.countryCode;
                                  });
                                },
                              );
                            },
                            text: ' +${countryCode}',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: '000 000 0000',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: kBlackColor.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
