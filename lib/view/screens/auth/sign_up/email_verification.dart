// import 'package:bio_pillow/constants/app_colors.dart';
// import 'package:bio_pillow/constants/app_fonts.dart';
// import 'package:bio_pillow/constants/app_images.dart';
// import 'package:bio_pillow/constants/app_sizes.dart';
// import 'package:bio_pillow/view/widget/custom_app_bar.dart';
// import 'package:bio_pillow/view/widget/custom_check_box_widget.dart';
// import 'package:bio_pillow/view/widget/heading_widget.dart';
// import 'package:bio_pillow/view/widget/my_button_widget.dart';
// import 'package:bio_pillow/view/widget/my_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:pinput/pinput.dart';

// class EmailVerification extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final DEFAULT_THEME = PinTheme(
//       width: 80,
//       height: 70,
//       margin: EdgeInsets.zero,
//       textStyle: TextStyle(
//         fontSize: 20,
//         height: 0.0,
//         fontWeight: FontWeight.bold,
//         color: kBlackColor,
//         fontFamily: AppFonts.Poppins,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(width: 1.0, color: kBorderColor),
//         color: kBorderColor,
//       ),
//     );
//     return Scaffold(
//       appBar: simpleAppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: ListView(
//               shrinkWrap: true,
//               padding: AppSizes.DEFAULT,
//               physics: BouncingScrollPhysics(),
//               children: [
//                 AuthHeading(
//                   title: 'Enter OTP Code 🔐',
//                   subTitle:
//                       "We've sent an OTP code to your email. Please enter the code below to continue.",
//                 ),
//                 SizedBox(height: 10),
//                 Pinput(
//                   length: 4,
//                   onChanged: (value) {},
//                   pinContentAlignment: Alignment.center,
//                   defaultPinTheme: DEFAULT_THEME,
//                   focusedPinTheme: DEFAULT_THEME.copyWith(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(width: 1.0, color: kSecondaryColor),
//                       color: kSecondaryColor.withOpacity(0.1),
//                     ),
//                   ),
//                   submittedPinTheme: DEFAULT_THEME.copyWith(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(width: 1.0, color: kPrimaryColor),
//                       color: kGreyColor.withOpacity(0.1),
//                     ),
//                   ),
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   separatorBuilder: (index) {
//                     return SizedBox(width: 20);
//                   },
//                   onCompleted: (pin) => print(pin),
//                 ),
//                 SizedBox(height: 35),
//                 Center(
//                   child: Wrap(
//                     children: [
//                       MyText(
//                         text: 'You can resend the code in',
//                         textAlign: TextAlign.center,
//                         color: kGreyColor,
//                         size: 16,
//                         weight: FontWeight.w500,
//                         paddingBottom: 12,
//                       ),
//                       MyText(
//                         text: ' 56 ',
//                         textAlign: TextAlign.center,
//                         color: kSecondaryColor,
//                         size: 16,
//                         paddingBottom: 12,
//                       ),
//                       MyText(
//                         text: 'seconds ',
//                         textAlign: TextAlign.center,
//                         color: kGreyColor,
//                         size: 16,
//                         weight: FontWeight.w500,
//                         paddingBottom: 15,
//                       ),
//                     ],
//                   ),
//                 ),
//                 MyText(
//                   text: 'Resend Code ',
//                   textAlign: TextAlign.center,
//                   color: kGreyColor.withValues(alpha: 0.7),
//                   size: 18,
//                   weight: FontWeight.w600,
//                   paddingBottom: 12,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: AppSizes.DEFAULT,
//             child: MyButton(
//               buttonText: 'Continue',
//               onTap: () {
//                 Get.dialog(_BasicDataCompleteness());
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _BasicDataCompleteness extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: kPrimaryColor,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   MyText(
//                     paddingTop: 20,
//                     text: 'Basic Data Completeness',
//                     size: 16,
//                     textAlign: TextAlign.center,
//                     weight: FontWeight.w700,
//                   ),
//                   Expanded(
//                     child: ListView(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       padding: EdgeInsets.all(20),
//                       children: [
//                         Row(
//                           spacing: 10,
//                           children: [
//                             MyText(
//                               text: '10%',
//                               color: kBlackColor,
//                               weight: FontWeight.w500,
//                             ),
//                             Expanded(
//                               child: LinearPercentIndicator(
//                                 padding: EdgeInsets.zero,
//                                 lineHeight: 9,
//                                 percent: 0.1,
//                                 backgroundColor: kBorderColor,
//                                 progressColor: kSecondaryColor,
//                                 barRadius: Radius.circular(10),
//                               ),
//                             ),
//                           ],
//                         ),
//                         MyText(
//                           text:
//                               'Complete the following steps to fill in your company data',
//                           textAlign: TextAlign.center,
//                           paddingTop: 12,
//                           lineHeight: 1.5,
//                           paddingBottom: 16,
//                           color: kBlackColor,
//                         ),
//                         Column(
//                           spacing: 8,
//                           children: [
//                             ...List.generate(8, (index) {
//                               List<String> _items = [
//                                 'Complete company data',
//                                 'Add Department',
//                                 'Add Work Pattern',
//                                 'Add Employees',
//                                 'Manage Workday Schedule',
//                                 'Manage Salary Rates',
//                                 'Manage Tax Rates',
//                                 'Add Admin',
//                               ];
//                               return Container(
//                                 height: 48,
//                                 padding: EdgeInsets.symmetric(horizontal: 12),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                     width: 1,
//                                     color: kBorderColor2,
//                                   ),
//                                 ),
//                                 child: Row(
//                                   spacing: 12,
//                                   children: [
//                                     CustomCheckBox(
//                                       radius: 50,
//                                       isActive: index == 0 ? true : false,
//                                       onTap: () {},
//                                     ),
//                                     Expanded(
//                                       child: MyText(
//                                         size: 14,
//                                         maxLines: 1,
//                                         textOverflow: TextOverflow.ellipsis,
//                                         text: _items[index],
//                                         color:
//                                             index == 0
//                                                 ? kBlackColor
//                                                 : kGreyColor,
//                                         weight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       Assets.imagesArrowNext,
//                                       height: 18,
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   MyText(
//                     text: 'Maybe Later',
//                     textAlign: TextAlign.center,
//                     paddingBottom: 20,
//                     color: kSecondaryColor,
//                     weight: FontWeight.w600,
//                     onTap: () {
//                       // Get.offAll(() => BottomNavBar());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
