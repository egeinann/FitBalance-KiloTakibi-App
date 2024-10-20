import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';
import '../controller/onboarding_controller.dart';

class IntroNameScreen extends StatelessWidget {
  final OnboardingController onboardingController = Get.find();

  IntroNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Enter your name'.tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
                    child: CustomTextField(
                      controller: onboardingController.nameController,
                      labelText: "Your name".tr,
                      onChanged: (value) {
                        onboardingController.setUserName(value);
                      },
                      titleIcon: Icon(
                        Ionicons.person,
                        color: Colors.grey.shade700,
                      ),
                      maxLength: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
