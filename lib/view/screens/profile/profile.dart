import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/constants/app_sizes.dart';
import 'package:bio_pillow/main.dart';
import 'package:bio_pillow/view/screens/profile/account_settings.dart';
import 'package:bio_pillow/view/screens/profile/data_backup.dart';
import 'package:bio_pillow/view/screens/profile/linked_devices.dart';
import 'package:bio_pillow/view/screens/profile/profile_settings.dart';
import 'package:bio_pillow/view/screens/profile/linked_accounts.dart';
import 'package:bio_pillow/view/screens/profile/notifications_settings.dart';
import 'package:bio_pillow/view/widget/common_image_view_widget.dart';
import 'package:bio_pillow/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.HORIZONTAL,
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: CommonImageView(
              height: 100,
              width: 100,
              radius: 100,
              url: dummyImg,
            ),
          ),
          MyText(
            paddingTop: 10,
            text: 'Jhon Doe',
            size: 16,
            weight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2),
          MyText(
            text: 'example@email.com',
            size: 12,
            color: kQuaternaryColor,
            textAlign: TextAlign.center,
          ),
          MyText(
            paddingTop: 30,
            text: 'Account',
            size: 12,
            weight: FontWeight.w600,
            paddingBottom: 6,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileTile(
                  title: 'Profile Settings',
                  onTap: () {
                    Get.to(() => ProfileSettings());
                  },
                ),
                ProfileTile(
                  title: 'Account Settings',
                  onTap: () {
                    Get.to(() => AccountSettings());
                  },
                ),
                ProfileTile(
                  title: 'Linked Accounts',
                  onTap: () {
                    Get.to(() => LinkedAccounts());
                  },
                ),
                ProfileTile(
                  title: 'Data Backup',
                  onTap: () {
                    Get.to(() => DataBackup());
                  },
                ),
              ],
            ),
          ),

          MyText(
            paddingTop: 20,
            text: 'App',
            size: 12,
            weight: FontWeight.w600,
            paddingBottom: 6,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileTile(
                  title: 'Linked Devices',
                  onTap: () {
                    Get.to(() => LinkedDevices());
                  },
                ),
                ProfileTile(
                  title: 'Notifications',
                  onTap: () {
                    Get.to(() => NotificationsSettings());
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileTile(
                  icon: Assets.imagesDeactivateAccount,
                  title: 'Deactivate Account',
                  onTap: () {},
                ),
                ProfileTile(
                  icon: Assets.imagesLogout,
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback onTap;

  const ProfileTile({required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            CommonImageView(height: 20, width: 20, imagePath: icon!),
          ],
          Expanded(
            child: MyText(
              text: title,
              paddingLeft: icon != null ? 12 : 0,
              color: icon != null ? kPrimaryColor : kTertiaryColor,
            ),
          ),
          if (icon == null) Image.asset(Assets.imagesArrowNext, height: 18),
        ],
      ),
    );
  }
}
