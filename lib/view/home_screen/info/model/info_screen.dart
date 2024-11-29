import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/controllers/info_controller.dart';
import 'package:kilo_takibi_uyg/view/home_screen/info/view/activity_screen.dart';
import 'package:kilo_takibi_uyg/view/home_screen/info/view/nutrition_screen.dart';
import 'package:kilo_takibi_uyg/view/home_screen/info/view/sleep_screen.dart';
import 'package:kilo_takibi_uyg/view/home_screen/info/view/water_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends GetView<InfoController> {
  const InfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => controller.resetController(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.goBack();
              controller.resetController();
            },
            icon: const Icon(AppIcons.arrowBack),
          ),
          centerTitle: true,
          title: Text(
            "Healthy Weight Control".tr,
            style: Get.theme.textTheme.bodyLarge,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.lastPage(index);
                  },
                  children: const [
                    InfoNutritionScreen(),
                    InfoWaterScreen(),
                    InfoActivityScreen(),
                    InfoSleepScreen(),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: context.paddingLarge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        effect: WormEffect(
                          dotColor: Get.theme.cardColor,
                          activeDotColor: Get.theme.primaryColor,
                        ),
                        controller: controller.pageController,
                        count: 4,
                      ),
                      customFloatingActionButton(
                        heroTag: "balance",
                        widget: const Icon(AppIcons.forward),
                        onPressed: () {
                          controller.goToNextInfo();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
