import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:lottie/lottie.dart';

class IntroStartScreen extends StatelessWidget {
  const IntroStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Lottie.asset(
                'assets/lottie/startOnboarding.json',
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textColorizeAnimated(
                    text: "Welcome".tr,
                    textStyle: Get.theme.textTheme.titleLarge!,
                    isRepeat: false,
                  ),
                  SizedBox(height: Get.size.height * 0.02),
                  textTyperAnimated(
                    text:
                        'Easily record your weight and achieve your goals!'.tr,
                    textStyle: Get.theme.textTheme.bodyLarge!,
                    isRepeat: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
