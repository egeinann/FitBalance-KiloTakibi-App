import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class InfoWaterScreen extends StatelessWidget {
  const InfoWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLarge,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text("W A T E R".tr,
                      style: Get.theme.textTheme.displaySmall),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Image(
                    image: AssetImage("assets/images/weightInfo/water.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  'Adequate water intake helps you lose weight by speeding up your metabolism. Try to drink at least 8 glasses of water a day. Drinking water can help you avoid unnecessary snacking by increasing your feeling of fullness.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodySmall,
                ),
                const Icon(
                  AppIcons.water,
                  size: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
