import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/views/home_screen.dart';

class InfoController extends GetxController {
  PageController pageController = PageController();
  var onLastPage = false.obs;

  // sayfa ilerleme
  void goToNextInfo() {
    if (!onLastPage.value) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.to(HomeScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 700));
    }
  }

  // son sayfa ?
  void lastPage(int index) {
    onLastPage.value = (index == 3);
  }
}
