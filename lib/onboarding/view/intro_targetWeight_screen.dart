import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_weight.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class IntroTargetWeightScreen extends GetView<Controller> {
  final UserController _userController = Get.find();
  final onboardingController = Get.find<OnboardingController>();
  final SettingsController _settingsController = Get.find();
  IntroTargetWeightScreen({super.key}) {
    // Animasyonu yalnızca TargetWeight sayfasında başlat
    onboardingController.isOnTargetWeightPage.listen((isActive) {
      if (isActive) {
        animateTargetWeight();
      }
    });
  }

  void animateTargetWeight() {
    _userController.setTargetWeight(70.0); // Başlangıç değeri
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      // Değer azaldıkça hedef kilo güncelleniyor
      double currentTargetWeight = _userController.user.value.targetWeight - 1;
      _userController.setTargetWeight(currentTargetWeight);
      if (currentTargetWeight <= 60) {
        timer.cancel(); // 60'a ulaştığında animasyonu durdur
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => NumberPickerWeight(
                    isKgSelected: _settingsController.isKgSelected,
                    value: _userController.user.value.targetWeight,
                    onChanged: (value) {
                      _userController.setTargetWeight(
                          value); // targetWeight'i controller üzerinden güncelleriz
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Obx(
                  () => Text(
                    _settingsController.weightUnit,
                    style: Get.theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Obx(
                () => customToggleButton(
                  isSelected: [
                    _settingsController.isKgSelected.value,
                    !_settingsController.isKgSelected.value
                  ],
                  onPressed: (int index) {
                    _settingsController.toggleWeightUnit();
                  },
                  children: [
                    Text(
                      'kg'.tr,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      'lbs'.tr,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
