import 'package:cloudflare/controller/controller.dart';
import 'package:cloudflare/view/colors.dart';
import 'package:cloudflare/view/wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final GradientTextAnimationController controller =
      Get.put(GradientTextAnimationController());
  final GradientTextAnimationController _homeScreenController =
      Get.put(GradientTextAnimationController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            height: 100,
            width: 200,
            //color: Colors.red,
            child: GetBuilder<GradientTextAnimationController>(
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
          Obx(
            () => Text(
              _homeScreenController.isSwitched.value
                  ? 'Your DNS queries are'
                  : 'Your DNS queries are not',
              // 'Your DNS queries are',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          RichText(
            text: TextSpan(
                text: 'private',
                style: TextStyle(color: Colors.orange[900], fontSize: 18),
                children: <TextSpan>[
                  const TextSpan(
                    text: ' and',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'faster',
                    style: TextStyle(color: Colors.orange[900], fontSize: 18),
                  )
                ]),
          ),

          //  Text(
          //   _homeScreenController.isSwitched.value
          //       ? 'private and faster'
          //       : 'private',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     color: _homeScreenController.isSwitched.value
          //         ? Colors.orange[900]
          //         : null,
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [

          //       const SizedBox(
          //         height: 60,
          //       ),

          //       const SizedBox(
          //         height: 30,
          //       ),

          //     ],
          //   ),
          // ),
          Spacer(),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    height: 50,
                    width: 110, // Adjust the width as needed
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.pink, Colors.orange],
                      ),
                      borderRadius:
                          BorderRadius.circular(10), // Adjust as needed
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => WrapScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Make button transparent
                        elevation: 0, // Remove button shadow
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Same as container
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
