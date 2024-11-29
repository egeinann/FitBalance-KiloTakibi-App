import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class AboutTheAppScreen extends StatelessWidget {
  const AboutTheAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'About The App'.tr,
          style: Get.theme.textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText('FitBalance'.tr,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyLarge),
                  const SizedBox(height: 10),
                  AutoSizeText(
                      'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.'
                          .tr,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  AutoSizeText('Version: 1.0.0'.tr,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  AutoSizeText('Developed by: egedeveloper'.tr,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyMedium),
                  AutoSizeText('Mail: fitbalance.app@gmail.com'.tr,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyMedium),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(AppIcons.fitness),
                    const SizedBox(height: 5),
                    Text("You must be healthy !".tr,
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.bodySmall)
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
