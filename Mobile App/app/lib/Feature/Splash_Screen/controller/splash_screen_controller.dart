import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Nav_bar/view/nav_bar.dart';
import '../../Nav_bar/view/new_nav_bar.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sharkAnimation;
  late Animation<double> textOpacity;

  @override
  void onInit() {
    super.onInit();
    // Initialize the AnimationController here
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    sharkAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0),
      ),
    );
    animationController.forward();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 20), () {
    // Get.to(()=>NavbarView());
      Get.to(()=>NewNavBar());
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
