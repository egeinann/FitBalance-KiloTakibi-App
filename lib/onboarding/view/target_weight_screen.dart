import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import '../controller/onboarding_controller.dart';

class TargetWeightScreen extends StatefulWidget {
  const TargetWeightScreen({super.key});

  @override
  _TargetWeightScreenState createState() => _TargetWeightScreenState();
}

class _TargetWeightScreenState extends State<TargetWeightScreen> {
  final OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                    'Enter your target weight',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: Get.size.height * 0.03),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    width: Get.size.width * 0.5,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Obx(
                          () => Numbers(
                            value: onboardingController.targetWeight.value,
                            onChanged: (value) {
                              onboardingController.setTargetWeight(value);
                            },
                          ),
                        ),
                        const Icon(
                          Icons.arrow_left_rounded,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}