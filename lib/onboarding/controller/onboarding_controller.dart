import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/view/home_screen.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  var userName = ''.obs;
  var targetWeight = 70.0.obs;
  var onLastPage = false.obs;

  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();

  void lastPage(int index) {
    onLastPage.value = (index == 4);
  }

  void setUserName(String name) {
    userName.value = name;
  }

  void setTargetWeight(double weight) {
    targetWeight.value = weight;
  }

  void goToNextPage() {
    Get.focusScope?.unfocus();
    if (onLastPage.value) {
      // Son sayfadaysanız
      if (nameController.text.isEmpty) {
        Get.snackbar(
          "",
          "Please enter your name",
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        );
        pageController.animateToPage(
          3,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ); // Geçiş animasyonu ile NameScreen'e dön
      } else {
        // Geçerli kullanıcı adı ile HomeScreen'e geçiş
        Get.offAll(HomeScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 700));
        resetController();
      }
    } else {
      // Son sayfada değilse bir sonraki sayfaya geçiş
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Controller sıfırlama
  void resetController() {
    pageController.dispose();
    pageController = PageController();
    onLastPage.value = false;
  }
}
