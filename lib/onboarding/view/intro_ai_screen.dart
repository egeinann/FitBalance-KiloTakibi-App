import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  AutoSizeText(
                    'Artificial Intelligence Model'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: Get.size.height * 0.02),
                  AutoSizeText(
                    'Embark on a healthy journey with an AI powered chatbot, try premium!'
                        .tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
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
