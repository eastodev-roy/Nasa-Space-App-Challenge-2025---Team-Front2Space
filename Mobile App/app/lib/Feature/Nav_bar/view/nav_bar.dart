import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/nav_bar_controller.dart';


class NavbarView extends StatelessWidget {
  final NavBarController controller = Get.put(NavBarController());

  final List<Widget> pages = [
    // HomePage(),
    // JobPage(),
    // CommunityPage(),
    // SkillDevelopmentPage(),
    // ProfilePage(),
  ];

  final List<String> labels = [
    'Home',
    'Visualization ',
    'Shark',
    'Skill Development',
    'Profile',
  ];

  /// Updated to hold pairs: [selectedIcon, unselectedIcon]
  final List<List<String>> iconPairs = [
    // [ImagePath.activeHome, ImagePath.inactiveHome],
    // [ImagePath.activeJob, ImagePath.inactiveJob],
    // [ImagePath.activeCommunity, ImagePath.inactiveCommunity],
    // [ImagePath.activeSkillDevelopment, ImagePath.inactiveSkillDevelopment],
    // [ImagePath.activeProfile, ImagePath.inactiveProfile],
  ];

  NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages.elementAt(controller.selectedIndex.value)),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Obx _buildBottomNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          log('selected index: $index');
          controller.changeIndex(index);
        },
        items: List.generate(
          labels.length,
              (index) => _buildNavItem(
            iconPairs[index][0], // selected icon
            iconPairs[index][1], // unselected icon
            labels[index],
            index,
          ),
        ),
      );
    });
  }

  BottomNavigationBarItem _buildNavItem(
      String selectedIconPath,
      String unselectedIconPath,
      String label,
      int index,
      ) {
    return BottomNavigationBarItem(
      icon: Obx(() {
        final isSelected = controller.selectedIndex.value == index;
        // log(
        //   'Loading icon: ${isSelected ? selectedIconPath : unselectedIconPath}',
        // );
        return Image.asset(
          isSelected ? selectedIconPath : unselectedIconPath,
          height: 30,
          width: 30,
        );
      }),
      label: label,
    );
  }
}