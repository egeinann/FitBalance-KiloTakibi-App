import 'dart:math';

import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:rive/rive.dart';

class RiveController extends GetxController {
  RiveAnimationController? currentController;
  final Controller _controller = Get.find();
  // Rive dosyasındaki animasyon isimleri
  var currentAnimationName = ''.obs;
  final String standAnimation = 'Stand';
  final String walkAnimation = 'Walk';
  final String runAnimation = 'Run';
  final String jumpAnimation = 'Jump';

  // targetWeightAchieved
  String weightAchievedMessage =
      "Congratulations! You've reached your goal.".tr;

  // new record messages
  final List<String> newRecordMessages = [
    "Great job! You've added a new weight record! You're progressing healthily!"
        .tr,
    "Congratulations! You've successfully recorded your weight! You're progressing step by step towards your goals!"
        .tr,
    "Excellent! You've added a new weight record! Keep up your healthy habits!"
        .tr,
    "Well done! You've added a new weight record! Keep moving forward in a healthy way!"
        .tr,
  ];
  // başlangıç hareketi?
  @override
  void onInit() {
    super.onInit();
    _controller.checkTargetAchieved();
    if (_controller.targetAchieved.value) {
      changeAnimation(jumpAnimation);
    } else {
      Random random = Random();
      bool isRun = random.nextBool();
      changeAnimation(isRun ? runAnimation : walkAnimation);
    }
  }

  void changeAnimation(String animationName) {
    currentController?.isActive = false; // Mevcut controller varsa pasif yap
    currentController =
        SimpleAnimation(animationName); // Yeni controller'i başlat
    currentAnimationName.value = animationName; // Mevcut animasyonu güncelle
    update(); // UI'ı güncelle
  }

  // Arkaplan animasyonu için hareketlenme
  bool isAnimationActive() {
    // currentAnimationName'e doğrudan erişim
    return !(currentAnimationName.value == standAnimation ||
        currentAnimationName.value == jumpAnimation);
  }
}
