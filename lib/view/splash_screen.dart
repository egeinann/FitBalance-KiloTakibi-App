import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initializeControllers().then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(Routes.mainscreen);
      });
    });

    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage("assets/images/splash/fit_balance_logo.png"),
          fit: BoxFit.scaleDown,
          width: Get.size.width * 0.3,
        ),
      ),
    );
  }

  // Controller'ları initialize eden fonksiyon
  Future<void> initializeControllers() async {
    // Tüm controller'ların başlatılmasını bekle
    await Future.wait([
      Get.putAsync(() async => Controller()), // Controller başlatılması
      Get.putAsync(
          () async => SettingsController()), // SettingsController başlatılması
      Get.putAsync(() async =>
          GetMaterialController()), // GetMaterialController başlatılması
    ]);
  }
}
