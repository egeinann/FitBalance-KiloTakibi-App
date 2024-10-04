import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gauge_indicator/gauge_indicator.dart'; // Gauge göstergesi için
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/controller/bmi_controller.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/view/bmi_info.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:numberpicker/numberpicker.dart';

class BmiScreen extends StatelessWidget {
  final BMIController bmiController = Get.find();

  BmiScreen({super.key}); // Controller'ı initialize et

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("Calculate BMI",
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Column(
          children: [
            inputHeight(context),
            const Divider(),
            inputWeight(context),
            outputRadialgauge(context),
          ],
        ),
      ),
      floatingActionButton: floatingButtonBmi(context),
    );
  }

  // *** WHAT IS THIS BMI BUTTON ***
  Padding floatingButtonBmi(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: CustomFloatingActionButton(
        heroTag: "bmi",
        widget: const Icon(Icons.question_mark_sharp),
        onPressed: () {
          Get.to(const BmiInfoScreen(), transition: Transition.downToUp);
        },
      ),
    );
  }

  // *** ÖLÇÜM BARI ***
  Widget outputRadialgauge(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Obx(
        () {
          double bmiValue = bmiController.bmiModel.value.bmi;
          String message = ""; // Mesajı tutacak değişken

          // BMI değerine göre mesajı belirle
          if (bmiValue < 18.5) {
            message = "Zayıf görünüyorsunuz, kilo almalısınız.";
          } else if (bmiValue >= 18.5 && bmiValue < 25) {
            message = "Vücudunuz oldukça iyi görünüyor.";
          } else if (bmiValue >= 25 && bmiValue < 30) {
            message = "Hafif bir kilo fazlanız var.";
          } else {
            message = "Oldukça kilolu görünüyorsunuz, Kilo vermelisiniz.";
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
              const SizedBox(height: 5),
              Expanded(
                child: Column(
                  children: [
                    Text('BMI: ${bmiValue.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).canvasColor,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: AutoSizeText(
                          message,
                          key: UniqueKey(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Icon(Ionicons.fitness),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // *** KİLO GİRİŞİ ***
  Widget inputWeight(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const Icon(Ionicons.scale),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Numbers(
                  value: bmiController.bmiModel.value.weight,
                  onChanged: (newWeight) {
                    bmiController.updateWeight(newWeight); // Kilo güncelle
                  },
                );
              }),
              Text("kg", style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }

  // *** BOY GİRİŞİ ***
  Widget inputHeight(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const Icon(Icons.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => DecimalNumberPicker(
                  selectedTextStyle: Theme.of(context).textTheme.displaySmall,
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  itemCount: 3,
                  itemWidth: Get.size.width * 0.14,
                  itemHeight: Get.size.height * 0.06,
                  axis: Axis.horizontal,
                  minValue: 100, // Minimum boy
                  maxValue: 250, // Maksimum boy
                  value:
                      bmiController.bmiModel.value.height, // Başlangıç değeri
                  onChanged: (newHeight) {
                    bmiController.updateHeight(newHeight); // Boyu güncelle
                  },
                ),
              ),
              Text("cm", style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
