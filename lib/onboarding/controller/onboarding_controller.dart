import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/view/home_screen.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs; // 0'ınıc indexten başla
  var onLastPage = false.obs; // son sayfada mıyız?
  
  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();

  // *** son sayfa mı ***
  void lastPage(int index) {
    onLastPage.value = (index == 5);
  }

  // *** SONRAKİ SAYFAYA ADIMA GEÇİŞ ***
  void goToNextPage() {
    Get.focusScope?.unfocus();
    if (onLastPage.value) {
      // Son sayfadaysanız
      if (nameController.text.isEmpty) {
        SnackbarHelper.showSnackbar(
          title: "Enter your name !".tr,
          message: "This section cannot be left blank".tr,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          icon: const Icon(Ionicons.person),
        );
        pageController.animateToPage(
          4,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ); // Geçiş animasyonu ile NameScreen'e dön
      } else {
        // Geçerli kullanıcı adı ile HomeScreen'e geçiş
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.offAll(HomeScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 1200));
        });
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

  // *** CONTROLLER SIFIRLAMA ***
  void resetController() {
    pageController.dispose();
    pageController = PageController();
    onLastPage.value = false;
  }
}
