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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.size.height * 0.1,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: context.paddingLarge,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text("A C T I V I T Y",
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/images/weightInfo/run.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: context.paddingLarge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      'The basis of healthy weight control is a balanced and regular diet. At every meal, be sure to consume a balance of protein, carbohydrates and healthy fats. Avoid fast food and processed foods, prefer fresh fruits, vegetables and whole grain products.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Icon(
                      Ionicons.nutrition,
                      size: 50,
                    )
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
