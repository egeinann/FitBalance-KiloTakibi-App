import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';

class IntroTargetWeightScreen extends GetView<Controller> {
  final onboardingController = Get.find<OnboardingController>();

  IntroTargetWeightScreen({super.key}) {
    // Animasyonu yalnızca TargetWeight sayfasında başlat
    onboardingController.isOnTargetWeightPage.listen((isActive) {
      if (isActive) {
        animateTargetWeight();
      }
    });
  }

  void animateTargetWeight() {
    controller.targetWeight.value = 70.0; // Başlangıç değeri
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      controller.targetWeight.value -= 1;
      if (controller.targetWeight.value <= 60) {
        timer.cancel(); // 50'ye ulaştığında animasyonu durdur
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textColorizeAnimated(
              text: 'Enter your target weight'.tr,
              textStyle: Get.theme.textTheme.titleLarge!,
              isRepeat: false,
            ),
            const SizedBox(height: 20),
            Obx(
              () => Numbers(
                value: controller.targetWeight.value,
                onChanged: (value) {
                  controller.setTargetWeight(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
