import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramService {
  void launchInstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/fitbalance_app/');
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      // Eğer URL açılacak bir uygulama bulunamazsa, bu mesajı yazdır
      Get.defaultDialog(
        title: 'Error'.tr,
        middleText: 'Instagram app or suitable browser not found!'.tr,
        textConfirm: 'Close'.tr,
        buttonColor: Get.theme.primaryColor,
        confirmTextColor: Colors.white,
        titleStyle: Get.theme.textTheme.bodyLarge,
        middleTextStyle: Get.theme.textTheme.bodySmall,
        onConfirm: () {
          // Dialogu kapat
          Get.back();
        },
      );
    }
  }
}
