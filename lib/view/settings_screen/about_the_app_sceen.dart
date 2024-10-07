import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class AboutTheAppScreen extends StatelessWidget {
  const AboutTheAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'About The App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText('FitBalance',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 10),
                AutoSizeText(
                    'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                AutoSizeText('Version: 1.0.0',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 5),
                AutoSizeText('Developed by: egedeveloper',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
                AutoSizeText('Mail: fitbalance.app@gmail.com',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Ionicons.fitness),
                  const SizedBox(height: 5),
                  Text("You must be healthy !",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
