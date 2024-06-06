import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientTextAnimationController extends GetxController
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  late AnimationController animationController;
    var isSwitched = true.obs;


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
  }
}