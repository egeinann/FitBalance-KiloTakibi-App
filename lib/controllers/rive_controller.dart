import 'dart:math';

import 'package:get/get.dart';
import 'package:rive/rive.dart';

class RiveController extends GetxController {
  RiveAnimationController? currentController;
  final String riveFileName = 'assets/animations/animasyon_dosyaniz.riv';

  // Rive dosyasındaki animasyon isimleri
  var currentAnimationName = ''.obs;
  final String standAnimation = 'Stand';
  final String walkAnimation = 'Walk';
  final String runAnimation = 'Run';
  final String jumpAnimation = 'Jump';

  // başlangıç hareketi?
  @override
  void onInit() {
    super.onInit();
    Random random = Random();
    bool isRun = random.nextBool(); // true veya false rastgele seçer

    // Rastgele seçime göre animasyonu değiştirin
    changeAnimation(isRun ? runAnimation : walkAnimation);
  }

  // Animasyonu değiştir button ile
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
