import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientTextAnimationController extends GetxController
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  late AnimationController animationController;
    var isSwitched = false.obs;
      // var isSwitched = false.obs;
  var statusText = "Disconnected".obs;


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

  void toggleSwitchh() {
    isSwitched.value = !isSwitched.value;
  }
  void toggleSwitch() {
    if (isSwitched.value) {
      statusText.value = "Disconnecting";
      isSwitched.value = false;
      Future.delayed(const Duration(seconds: 3), () {
        statusText.value = "Disconnected";
      });
    } else {
      statusText.value = "Connecting";
      isSwitched.value = true;
      Future.delayed(const Duration(seconds: 3), () {
        statusText.value = "Connected";
      });
    }
  }

 void handleSwitchOff(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text("Pause 1.1.1.1"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("How long would you like to disable 1.1.1.1 for?"),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                isSwitched.value = false;
                statusText.value = "Disconnected for 15 minutes";
                Get.back();
                Future.delayed(const Duration(minutes: 15), () {
                  isSwitched.value = true;
                  statusText.value = "Connected";
                });
              },
              child: const Text("Pause for 15 minutes"),
            ),
            TextButton(
              onPressed: () {
                isSwitched.value = false;
                statusText.value = "Disconnected for 1 hour";
                Get.back(); // Close the dialog
                Future.delayed(const Duration(hours: 1), () {
                  isSwitched.value = true;
                  statusText.value = "Connected";
                });
              },
              child: const Text("Pause for 1 hour"),
            ),
            TextButton(
              onPressed: () {
                // Implement the logic for pausing for this Wi-Fi here
                isSwitched.value = false;
                statusText.value = "Disconnected for this Wi-Fi";
                Get.back(); // Close the dialog
                // Add any additional logic if needed
              },
              child: const Text("Pause for this Wi-Fi"),
            ),
            TextButton(
              onPressed: () {
                isSwitched.value = false;
                statusText.value = "Disconnected until turned back on";
                Get.back(); // Close the dialog
              },
              child: const Text("Until I turn it back on"),
            ),
          ],
        ),
      ),
    );
  }

}