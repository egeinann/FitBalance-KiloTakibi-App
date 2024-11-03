import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_ai_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_photoGallery_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_graph_screen.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../view/intro_start_screen.dart';
import '../view/intro_name_Screen.dart';
import '../view/intro_targetWeight_screen.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.paddingLarge,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    Get.focusScope?.unfocus();
                    controller.lastPage(index);
                  },
                  children: [
                    const IntroStartScreen(),
                    const IntroGraphScreen(),
                    const IntroPhotoGalleryScreen(),
                    const IntroAiScreen(),
                    IntroNameScreen(),
                    IntroTargetWeightScreen(),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      effect: WormEffect(
                        dotColor: Theme.of(context).cardColor,
                        activeDotColor: Theme.of(context).primaryColor,
                      ),
                      controller: controller.pageController,
                      count: 6,
                    ),
                    CustomFloatingActionButton(
                      heroTag: "onboarding",
                      widget: const Icon(Ionicons.arrow_forward),
                      onPressed: () {
                        controller.goToNextPage();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
