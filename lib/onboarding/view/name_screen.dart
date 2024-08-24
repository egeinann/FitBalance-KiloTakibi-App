import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../controller/onboarding_controller.dart';

class NameScreen extends StatelessWidget {
  final OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.size.height * 0.1,
            horizontal: Get.size.width * 0.05),
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
                    SizedBox(height: Get.size.height*0.03),
                    TextField(
                      inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'\s')), // Boşluk karakterlerini engeller
                        ],
                      maxLength: 12,
                      controller: onboardingController.nameController,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Your name',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).cardColor,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade700,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        prefixIcon: Icon(
                          Ionicons.person,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      cursorColor: Theme.of(context).focusColor,
                      style: Theme.of(context).textTheme.titleLarge,
                      onChanged: (value) {
                        onboardingController.setUserName(value);
                      },
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
