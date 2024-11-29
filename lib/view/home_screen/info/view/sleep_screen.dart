import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class InfoSleepScreen extends StatelessWidget {
  const InfoSleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    child: Text("S L E E P".tr,
                        style: Get.theme.textTheme.displaySmall),
                  ),
                  const Image(
                    image: AssetImage("assets/images/weightInfo/sleep.png"),
                    fit: BoxFit.scaleDown,
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
                    'Sufficient and quality sleep is necessary for the body to rest and renew. Make sure to sleep 7-9 hours a day. Insufficient sleep can increase appetite and lead to weight gain. Maintaining your sleep pattern supports weight control.'
                        .tr,
                    textAlign: TextAlign.center,
                    style: Get.theme.textTheme.bodySmall,
                  ),
                  const Icon(
                    AppIcons.moon,
                    size: 25,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
