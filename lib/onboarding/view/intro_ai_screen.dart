import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:lottie/lottie.dart';

class IntroAiScreen extends StatelessWidget {
  const IntroAiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Lottie.asset(
                'assets/lottie/aiOnboarding.json',
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textColorizeAnimated(
                    text: 'Artificial Intelligence Model'.tr,
                    textStyle: Get.theme.textTheme.titleLarge!,
                    isRepeat: false,
                  ),
                  SizedBox(height: Get.size.height * 0.02),
                  textTyperAnimated(
                    text:
                        'Embark on a healthy journey with an AI powered chatbot, try premium!'
                            .tr,
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
