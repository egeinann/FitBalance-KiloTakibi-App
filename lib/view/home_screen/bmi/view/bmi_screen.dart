import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gauge_indicator/gauge_indicator.dart'; // Gauge göstergesi için
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/controllers/bmi_controller.dart';
import 'package:kilo_takibi_uyg/widgets/divider.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_height.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_weight.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';

class BmiScreen extends GetView<BMIController> {
  BmiScreen({super.key}); // Controller'ı initialize et
  final SettingsController _settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Calculate BMI".tr,
          style: Get.theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Column(
          children: [
            inputHeight(),
            const CustomDivider(),
            inputWeight(),
            outputRadialgauge(),
          ],
        ),
      ),
      floatingActionButton: floatingButtonBmi(),
    );
  }

  // *** BMI INFO FLOATING BUTTON ***
  Padding floatingButtonBmi() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 5),
      child: customFloatingActionButton(
        heroTag: "bmi",
        widget: const Icon(AppIcons.information),
        onPressed: () {
          Get.toNamed(Routes.bmiinfoscreen);
        },
      ),
    );
  }

  // *** ÖLÇÜM BARI ***
  Widget outputRadialgauge() {
    return Expanded(
      flex: 3,
      child: Obx(() {
        double bmiValue = controller.bmiModel.value.bmi;
        String message = ""; // Mesajı tutacak değişken

        // BMI değerine göre mesajı belirle
        if (bmiValue < 18.5) {
          message = "You look underweight, you should gain weight.".tr;
        } else if (bmiValue >= 18.5 && bmiValue < 25) {
          message = "Your body looks quite good.".tr;
        } else if (bmiValue >= 25 && bmiValue < 30) {
          message = "You have a slight excess weight.".tr;
        } else {
          message = "You look quite overweight, you should lose weight.".tr;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedRadialGauge(
                duration: const Duration(seconds: 1),
                curve: Curves.elasticOut,
                radius: 100,
                value: bmiValue,
                axis: const GaugeAxis(
                  min: 0,
                  max: 40,
                  degrees: 180,
                  style: GaugeAxisStyle(
                    thickness: 30,
                    background: Colors.transparent,
                    segmentSpacing: 2,
                  ),
                  pointer: GaugePointer.needle(
                    height: 60,
                    width: 40,
                    color: Color.fromARGB(255, 13, 20, 202),
                  ),
                  progressBar: GaugeProgressBar.rounded(
                    color: Colors.transparent,
                  ),
                  segments: [
                    GaugeSegment(
                      from: 0,
                      to: 18.5,
                      color: Color.fromARGB(255, 225, 203, 3),
                      cornerRadius: Radius.circular(5),
                    ),
                    GaugeSegment(
                      from: 18.5,
                      to: 24.9,
                      color: Colors.green,
                      cornerRadius: Radius.circular(5),
                    ),
                    GaugeSegment(
                      from: 25,
                      to: 29.9,
                      color: Colors.orange,
                      cornerRadius: Radius.circular(5),
                    ),
                    GaugeSegment(
                      from: 30,
                      to: 40,
                      color: Colors.red,
                      cornerRadius: Radius.circular(5),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${"BMI: ".tr} ${bmiValue.toStringAsFixed(1)}',
                      style: Get.theme.textTheme.bodyLarge),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.theme.canvasColor,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: AutoSizeText(
                        message,
                        key: UniqueKey(),
                        style: Get.theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Icon(AppIcons.fitness),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // *** KİLO GİRİŞİ ***
  Widget inputWeight() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        const Icon(AppIcons.indicator),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return NumberPickerWeight(
                  isKgSelected: _settingsController.isKgSelected,
                  value: controller.bmiModel.value.weight,
                  onChanged: (newWeight) {
                    controller.updateWeight(newWeight);
                  },
                );
              },
            ),
            const SizedBox(width: 5),
            Text(_settingsController.weightUnit,
                style: Get.theme.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }

  // *** BOY GİRİŞİ ***
  Widget inputHeight() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        const Icon(AppIcons.man),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => NumberPickerHeight(
                isCmSelected: _settingsController.isCmSelected,
                value: controller.bmiModel.value.height,
                onChanged: (newHeight) {
                  controller.updateHeight(newHeight);
                },
              ),
            ),
            const SizedBox(width: 5),
            Text(_settingsController.heightUnit,
                style: Get.theme.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
