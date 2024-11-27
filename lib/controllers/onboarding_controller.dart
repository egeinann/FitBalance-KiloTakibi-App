import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final Controller _controller = Get.find();
  
  var currentIndex = 0.obs;
  var onLastPage = false.obs;
  var isOnTargetWeightPage =
      false.obs; // TargetWeight sayfasına geldiğinde animasyonu tetiklemek için

  // Son sayfa kontrolü
  void lastPage(int index) {
    onLastPage.value = (index == 5);
    isOnTargetWeightPage.value =
        (index == 5); // TargetWeight sayfasında olup olmadığını kontrol et
  }

  // Sonraki sayfaya geçiş
  void goToNextPage() {
    Get.focusScope?.unfocus();
    
    if (onLastPage.value) {
      // Son sayfadaysak, ismi kontrol et
      if (_controller.nameController.text.isEmpty) {
        SnackbarHelper.showSnackbar(
          title: "Enter your name !".tr,
          message: "This section cannot be left blank".tr,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          icon: const Icon(Ionicons.person),
        );

        // İsim ekranına geri dön
        pageController.animateToPage(
          4,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // Geçerli kullanıcı adı ile ana ekrana geçiş
        Get.offAllNamed(Routes.splashscreen);
        resetController();
      }
    } else {
      // Son sayfa değilse bir sonraki sayfaya geçiş
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Controller sıfırlama
  void resetController() {
    onLastPage.value = false;
    currentIndex.value = 0;
    isOnTargetWeightPage.value = false;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
