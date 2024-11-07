import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:lottie/lottie.dart';

class IntroPhotoGalleryScreen extends StatelessWidget {
  const IntroPhotoGalleryScreen({super.key});

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
                'assets/lottie/cameraOnboarding.json',
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textColorizeAnimated(
                    text: 'Photo & Gallery'.tr,
                    textStyle: Get.theme.textTheme.titleLarge!,
                    isRepeat: false,
                  ),
                  SizedBox(height: Get.size.height * 0.02),
                  textTyperAnimated(
                    text: 'Document your changes with photos!'.tr,
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

//Document your changes with photos!