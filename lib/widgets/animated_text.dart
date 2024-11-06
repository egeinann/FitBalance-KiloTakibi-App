import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// klavye text animasyonu
Widget textTyperAnimated({
  required String text,
  required TextStyle textStyle,
  required bool isRepeat,
}) {
  return AnimatedTextKit(
    animatedTexts: [
      TyperAnimatedText(
        text,
        textStyle: textStyle,
        speed: const Duration(milliseconds: 30),
      ),
    ],
    isRepeatingAnimation: isRepeat,
  );
}

// renki text animasyonu
Widget textColorizeAnimated({
  required String text,
  required TextStyle textStyle,
  required bool isRepeat,
}) {
  return AnimatedTextKit(
    animatedTexts: [
      ColorizeAnimatedText(
        colors: [
          Get.theme.primaryColor,
          Get.theme.cardColor,
          Get.theme.scaffoldBackgroundColor,
        ],
        text,
        textStyle: textStyle,
        speed: const Duration(milliseconds: 100),
      ),
    ],
    isRepeatingAnimation: isRepeat,
  );
}
