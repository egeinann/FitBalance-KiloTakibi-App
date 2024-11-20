import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/rive_controller.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class AnimationBackgroundScreen extends GetView<RiveController> {
  AnimationBackgroundScreen({super.key});
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final Rx<double> animationValue = 0.0
        .obs; // floating action button Animasyonu yönetecek Rx<double> değişkeni
    String randomMessage = controller.newRecordMessages[Random().nextInt(
        controller.newRecordMessages.length)]; // listeden random text seç
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5daee0),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Obx(
            () => Lottie.asset(
              "assets/lottie/skyBackground.json",
              fit: BoxFit.cover,
              repeat: false,
              animate: controller.isAnimationActive(),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(70, 64, 0, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: textTyperAnimated(
                      text: _controller.targetAchieved.value
                          ? controller.weightAchievedMessage
                          : randomMessage,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      isRepeat: false,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GetBuilder<RiveController>(
                  builder: (controller) {
                    return RiveAnimation.asset(
                      "assets/rive/appRunner.riv",
                      controllers: controller.currentController != null
                          ? [controller.currentController!]
                          : [],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FutureBuilder(
        future:
            Future.delayed(const Duration(seconds: 2)), // 2 saniye sonra başlat
        builder: (context, snapshot) {
          // Eğer işlem tamamlandıysa animasyonu başlat
          if (snapshot.connectionState == ConnectionState.done) {
            animationValue.value = 1.0;
          }

          return Obx(
            () => AnimatedOpacity(
              opacity: animationValue.value, // Opaklık animasyonu
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 5),
                child: customFloatingActionButton(
                  widget: const Icon(Icons.done),
                  onPressed: () {
                    Get.back(); // geri git
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
