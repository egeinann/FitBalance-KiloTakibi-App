import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/bar_graph.dart'
    as barGraph; // Önek ekledik
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/line_graph.dart'
    as lineGraph; // Önek ekledik

class GraphViewScreen extends GetView<Controller> {
  GraphViewScreen({super.key});

  final SettingsController _settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLow,
        child: Obx(
          () {
            // Öncelikle ödeme durumunu kontrol edelim
            if (!_settingsController.hasPaid.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image:
                            AssetImage("assets/images/mainScreen/payment.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            child: AutoSizeText(
                              "You must pay to see graphs and track your progress in more detail."
                                  .tr,
                              textAlign: TextAlign.center,
                              style: Get.theme.textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.size.width * 0.2,
                                  ),
                                  child: customFloatingActionButton(
                                    widget: AutoSizeText(
                                      "Upgrade premium".tr,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      _settingsController.completePayment();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            // Ödeme yapılmışsa kayıt sayısını kontrol edelim
            if (controller.records.isNotEmpty) {
              return PageView(
                physics: const BouncingScrollPhysics(),
                controller: controller
                    .pageController, // PageController'ı buraya ekleyin
                scrollDirection: Axis.vertical,
                onPageChanged: controller.onPageChanged,
                children: [
                  lineGraph.lineGraph(), // lineGraph ile erişim
                  barGraph.barGraph(), // barGraph ile erişim
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image: AssetImage(
                            "assets/images/mainScreen/null_graphs.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "No records available yet!".tr,
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
