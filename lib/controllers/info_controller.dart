import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  PageController pageController = PageController();
  var onLastPage = false.obs;

  // *** SAYFA İLERLEME ***
  void goToNextInfo() {
    if (!onLastPage.value) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
      resetController(); // MainScreen'e geçiş yaparken sıfırlama işlemi
    }
  }

  // *** SON SAYFA MI ? KONTROLÜ ***
  void lastPage(int index) {
    onLastPage.value = (index == 3);
  }

  // *** CONTROLLER SIFIRLAMA ***
  void resetController() {
    pageController.dispose();
    pageController = PageController();
    onLastPage.value = false;
  }

  // *** APPBAR LEADING TAP ***
  void goBack() {
    Get.back();
    resetController();
  }
}