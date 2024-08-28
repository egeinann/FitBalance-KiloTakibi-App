import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class InfoNutritionScreen extends StatelessWidget {
  const InfoNutritionScreen({super.key});

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
                    child: Text("N U T R I T I O N",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  const Image(
                    image: AssetImage("assets/images/weightInfo/foods.png"),
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
                    'The basis of healthy weight control is a balanced and regular diet. At every meal, be sure to consume a balance of protein, carbohydrates and healthy fats. Avoid fast food and processed foods, prefer fresh fruits, vegetables and whole grain products.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Icon(
                    Icons.local_dining_sharp,
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
