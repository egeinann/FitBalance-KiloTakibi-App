// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import '../controller/onboarding_controller.dart';

class IntroTargetWeightScreen extends StatefulWidget {
  const IntroTargetWeightScreen({super.key});

  @override
  _IntroTargetWeightScreenState createState() =>
      _IntroTargetWeightScreenState();
}

class _IntroTargetWeightScreenState extends State<IntroTargetWeightScreen> {
  final OnboardingController onboardingController = Get.find();

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter your target weight'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  width: Get.size.width * 0.5,
                  child: Obx(
                    () => Numbers(
                      value: onboardingController.targetWeight.value,
                      onChanged: (value) {
                        onboardingController.setTargetWeight(value);
                      },
                    ),
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
