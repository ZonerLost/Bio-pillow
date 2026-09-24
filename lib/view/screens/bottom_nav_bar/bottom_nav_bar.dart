import 'dart:io';
import 'package:bio_pillow/constants/app_colors.dart';
import 'package:bio_pillow/constants/app_images.dart';
import 'package:bio_pillow/view/screens/health_tips/health_tips.dart';
import 'package:bio_pillow/view/screens/home/home.dart';
import 'package:bio_pillow/view/screens/profile/profile.dart';
import 'package:bio_pillow/view/screens/wellness_program/wellness_program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _getCurrentIndex(int index) => setState(() {
    _currentIndex = index;
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {'icon': Assets.imagesHome, 'label': 'Home'},
      {'icon': Assets.imagesHealthTips, 'label': 'Health'},
      {'icon': Assets.imagesHealthTips, 'label': 'Wellness'},
      {'icon': Assets.imagesProfile, 'label': 'Profile'},
    ];

    final List<Widget> _screens = [
      Home(),
      HealthTips(),
      WellnessProgram(),
      Profile(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _buildNavBar(_items),
    );
  }

  Container _buildNavBar(List<Map<String, dynamic>> _items) {
    return Container(
      height: Platform.isIOS ? null : 65,
      decoration: BoxDecoration(
        color: Color(0xff0D0B14),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(width: 1.0, color: kBorderColor)),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: Colors.transparent,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kQuaternaryColor,
        currentIndex: _currentIndex,
        onTap: (index) => _getCurrentIndex(index),
        items: List.generate(_items.length, (index) {
          var data = _items[index];
          return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: ImageIcon(AssetImage(data['icon']), size: 24),
            ),
            label: data['label'].toString().tr,
          );
        }),
      ),
    );
  }
}
