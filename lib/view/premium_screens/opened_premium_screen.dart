import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:lottie/lottie.dart';

class OpenedPremiumScreen extends StatelessWidget {
  const OpenedPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9691ef),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/upgradePremium/isOpenedPremium.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: context.paddingLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textColorizeAnimated(
                  text:
                      "You Have Successfully Purchased Your Premium Membership!"
                          .tr,
                  textStyle: Get.theme.textTheme.titleLarge!,
                  isRepeat: false,
                ),
                const SizedBox(height: 20),
                textTyperAnimated(
                  text:
                      "Now you are all set to achieve your weight goals! Congratulations on embarking on this journey."
                          .tr,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  isRepeat: false,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Lottie.asset(
              'assets/lottie/openedPremiumRocket.json',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 30),
        child: customFloatingActionButton(
          widget: const Icon(Icons.done),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
