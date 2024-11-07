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
        textAlign: TextAlign.center,
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
          Get.theme.focusColor,
          Get.theme.cardColor,
          Get.theme.primaryColor,
        ],
        text,
        textStyle: textStyle,
        speed: const Duration(milliseconds: 200),
        textAlign: TextAlign.center,
      ),
    ],
    isRepeatingAnimation: isRepeat,
  );
}
