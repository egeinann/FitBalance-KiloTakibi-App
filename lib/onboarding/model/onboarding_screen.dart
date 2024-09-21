import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_camera_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_graph_screen.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../view/intro_start.dart';
import '../view/name_screen.dart';
import '../view/target_weight_screen.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController onboardingController =
      Get.put(OnboardingController());

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
                  controller: onboardingController.pageController,
                  onPageChanged: (index) {
                    Get.focusScope?.unfocus();
                    onboardingController.lastPage(index);
                  },
                  children: [
                    const IntroStart(),
                    const IntroGraph(),
                    const IntroCamera(),
                    NameScreen(),
                    const TargetWeightScreen(),
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
                      controller: onboardingController.pageController,
                      count: 5,
                    ),
                    CustomFloatingActionButton(
                      heroTag: "onboarding",
                      widget: const Icon(Ionicons.arrow_forward),
                      onPressed: () {
                        onboardingController.goToNextPage();
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
