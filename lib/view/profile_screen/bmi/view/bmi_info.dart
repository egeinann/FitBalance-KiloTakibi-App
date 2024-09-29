import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class BmiInfoScreen extends StatelessWidget {
  const BmiInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What is this BMI ?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: context.paddingLarge,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage("assets/images/bmi/bmi.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      "BMI (Body Mass Index) is a measure that estimates body fat based on a person's weight and height. It is used to assess whether an individual is in a healthy weight range.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    AutoSizeText(
                      "Below 18.5:  Underweight.\n18.5 - 24.9:  Normal weight\n25 - 29.9:  Overweight\n30 and above:  Obese",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Column(
                      children: [
                        const Icon(Ionicons.fitness),
                        const SizedBox(height: 10),
                        Text("You must be healthy !",
                            style: Theme.of(context).textTheme.bodySmall)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
