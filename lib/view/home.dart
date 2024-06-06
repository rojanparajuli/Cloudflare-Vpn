import 'package:cloudflare/controller/controller.dart';
import 'package:cloudflare/view/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  final GradientTextAnimationController controller =
      Get.put(GradientTextAnimationController());
  final GradientTextAnimationController _homeScreenController =
      Get.put(GradientTextAnimationController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '1.1.1.1 \n by Cloudflare',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '?',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, size: 36.0),
            onPressed: () {},
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 1,
                  child: Container(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 80,
                        ),
                        GetBuilder<GradientTextAnimationController>(
                          builder: (_) {
                            return AnimatedBuilder(
                              animation: controller.animationController,
                              builder: (context, child) {
                                return CustomPaint(
                                  painter: GradientTextPainter(
                                      controller.animationController.value),
                                  child: const Text(
                                    '1.1.1.1',
                                    style: TextStyle(
                                      fontSize: 500.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 3.0,
                          // Adjust the scale factor as needed
                          child: Obx(() => Switch(
                                // dragStartBehavior: DragStartBehavior.right,
                                value: _homeScreenController.isSwitched.value,
                                onChanged: (value) {
                                  _homeScreenController.toggleSwitch();
                                },
                                activeTrackColor: Colors.orange[900],
                                activeColor: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Obx(
                          () => Text(
                            _homeScreenController.isSwitched.value
                                ? 'Connected'
                                : 'Disconnected',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => Text(
                            _homeScreenController.isSwitched.value
                                ? 'Your DNS queries are'
                                : 'Your DNS queries are not',
                            // 'Your DNS queries are',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => Text(
                            _homeScreenController.isSwitched.value
                                ? 'private and faster'
                                : 'private',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _homeScreenController.isSwitched.value
                                  ? Colors.orange[900]
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
  decoration: BoxDecoration(
   border: Border.all(color: Colors.grey[100]!),
    borderRadius: BorderRadius.circular(30),
    boxShadow: const [BoxShadow(color: Colors.white)],
  ),
  height: 80,
  child: Row(
    children: [
      const SizedBox(width: 15),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enable 1.1.1.1 with WARP',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'a more private internet, for free',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      const SizedBox(width: 30),
      Container(
        height: 50,
        width: 110, // Adjust the width as needed
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.pink, Colors.orange],
          ),
          borderRadius: BorderRadius.circular(10), // Adjust as needed
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Make button transparent
            elevation: 0, // Remove button shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Same as container
            ),
          ),
          child: const Text(
            'Enable',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ],
  ),
)

        ],
      ),
    );
  }
}
