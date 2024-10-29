import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
