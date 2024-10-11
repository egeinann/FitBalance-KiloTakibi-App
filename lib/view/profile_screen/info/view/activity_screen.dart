import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class InfoActivityScreen extends StatelessWidget {
  const InfoActivityScreen({super.key});

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
                    child: Text("A C T I V I T Y".tr,
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  const Image(
                    image: AssetImage("assets/images/weightInfo/run.png"),
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
                    'Regular exercise plays a big role in weight control. Try to do at least 150 minutes of moderate aerobic activity per week. Activities such as walking, running, swimming or cycling will help you lose weight and maintain your overall health.'
                        .tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Icon(
                    Ionicons.bicycle,
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
