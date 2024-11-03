// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import '../../controllers/onboarding_controller.dart';

class IntroTargetWeightScreen extends GetView<Controller> {
  IntroTargetWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Get.size.height * 0.1,
          horizontal: Get.size.width * 0.05,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter your target weight'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}
