import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';
import '../controller/onboarding_controller.dart';

class NameScreen extends StatelessWidget {
  final OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.size.height * 0.1, horizontal: Get.size.width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Enter your name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: Get.size.height * 0.03),
                    CustomTextField(
                      controller: onboardingController.nameController,
                      labelText: "Your name",
                      onChanged: (value) {
                        onboardingController.setUserName(value);
                      },
                      titleIcon: Icon(
                          Ionicons.person,
                          color: Colors.grey.shade700,
                        ),
                      maxLength: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
