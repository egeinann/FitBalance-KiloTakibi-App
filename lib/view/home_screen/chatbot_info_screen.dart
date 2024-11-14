import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:lottie/lottie.dart';

class ChatBotInfoScreen extends StatelessWidget {
  const ChatBotInfoScreen({super.key});
  static const Color _pageColor = Color(0xFFF4CE14);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _pageColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Ionicons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: _pageColor,
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Lottie.asset(
                "assets/lottie/aiInfoScreen.json",
                fit: BoxFit.scaleDown,
              ),
            ),
            textTyperAnimated(
              text:
                  "Leverage the power of AI to reach your goals faster! With Fit-Balance Premium..."
                      .tr,
              textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              isRepeat: false,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Get.theme.cardColor,
                      child: const Icon(Ionicons.barbell),
                    ),
                    title: AutoSizeText(
                      "Receive personalized advice.!".tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Get.theme.cardColor,
                      child: const Icon(Ionicons.footsteps),
                    ),
                    title: AutoSizeText(
                      "Benefit from insights that support your progress!".tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Get.theme.cardColor,
                      child: const Icon(Ionicons.battery_charging),
                    ),
                    title: AutoSizeText(
                      "Gain daily tips to boost your motivation!".tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
