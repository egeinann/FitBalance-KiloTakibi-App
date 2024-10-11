import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/controller/info_controller.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/activity_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/nutrition_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/sleep_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/water_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});
  final InfoController _infoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          _infoController.resetController(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _infoController.goBack();
              _infoController.resetController();
            },
            icon: const Icon(Ionicons.chevron_back),
          ),
          centerTitle: true,
          title: Text(
            "Healthy Weight Control".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView(
                  controller: _infoController.pageController,
                  onPageChanged: (index) {
                    _infoController.lastPage(index);
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
                          dotColor: Theme.of(context).cardColor,
                          activeDotColor: Theme.of(context).primaryColor,
                        ),
                        controller: _infoController.pageController,
                        count: 4,
                      ),
                      CustomFloatingActionButton(
                        heroTag: "profile",
                        widget: const Icon(Ionicons.arrow_forward),
                        onPressed: () {
                          _infoController.goToNextInfo();
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
