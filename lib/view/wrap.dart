import 'package:cloudflare/controller/controller.dart';
import 'package:cloudflare/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapScreen extends StatelessWidget {
  final GradientTextAnimationController controller =
      Get.put(GradientTextAnimationController());
  final GradientTextAnimationController _homeScreenController =
      Get.put(GradientTextAnimationController());

  WrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1.1.1.1 ',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
            ),
            Text(
              "  by Cloudflare",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '?',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 100,
            width: 200,
            //color: Colors.red,
            child: GetBuilder<GradientTextAnimationController>(
              builder: (_) {
                return AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: GradientTextPainterWrap(
                          controller.animationController.value),
                      child: const Text(
                        'W A R P',
                        style: TextStyle(
                            fontSize: 500.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.transparent,
                            fontFamily: 'Anton'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Transform.scale(
            scale: 2.5,
            // Adjust the scale factor as needed
            child: Obx(() => Switch(
                  value: _homeScreenController.isSwitched.value,
                  onChanged: (value) {
                    if (value) {
                      _homeScreenController.toggleSwitch();
                    } else {
                      _homeScreenController.handleSwitchOff(context);
                    }
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
              _homeScreenController.statusText.value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: _homeScreenController.isSwitched.value
                        ? 'Your Internet is '
                        : 'Your Internet is not ',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black, // Set to black or your preferred default color
                    ),
                  ),
                  TextSpan(
                    text: 'private',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[900], // Set to orange color
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade200)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Image.asset(
                          'assets/dropaero.png',
                          height: 20,
                          width: 30,
                        )),
                        const Center(
                          child: Text(
                            'WARP+',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Center(
                            child: Text('Upgrade for an even better Internet',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
