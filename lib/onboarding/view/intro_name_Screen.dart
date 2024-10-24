import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';
import '../controller/onboarding_controller.dart';

class IntroNameScreen extends StatefulWidget {
  const IntroNameScreen({super.key});

  @override
  _IntroNameScreenState createState() => _IntroNameScreenState();
}

class _IntroNameScreenState extends State<IntroNameScreen> {
  final OnboardingController onboardingController = Get.find();
  final FocusNode _focusNode = FocusNode(); // FocusNode KASMA SORUNU İÇİN

  @override
  // KASMA SORUNU İÇİN DİSPOSE
  void dispose() {
    _focusNode.dispose(); // FocusNode'u temizliyoruz
    super.dispose();
  }

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
                      focusNode: _focusNode, // FocusNode kullanılıyor
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
