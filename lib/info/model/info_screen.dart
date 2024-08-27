import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/info/controller/info_controller.dart';
import 'package:kilo_takibi_uyg/info/view/activity_screen.dart';
import 'package:kilo_takibi_uyg/info/view/nutrition_screen.dart';
import 'package:kilo_takibi_uyg/info/view/sleep_screen.dart';
import 'package:kilo_takibi_uyg/info/view/water_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});
  final InfoController _infoController = Get.put(InfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 9,
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
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      splashColor: Theme.of(context).scaffoldBackgroundColor,
                      elevation: 10,
                      onPressed: () {
                        _infoController.goToNextInfo();
                      },
                      child: const Icon(Ionicons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
