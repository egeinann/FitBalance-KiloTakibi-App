import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/binding/controllers_binding.dart';
import 'package:kilo_takibi_uyg/config/themes.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/graphs_controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/language/language.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/onboarding/model/onboarding_screen.dart';
import 'package:kilo_takibi_uyg/services/notification_service.dart';
import 'package:kilo_takibi_uyg/view/home_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/controller/bmi_controller.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/controller/info_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter motorunu başlat
  final NotificationService notificationService =
      NotificationService(); // Servis sınıfını tanıtılıyor
  bool permissionGranted = await notificationService
      .requestNotificationPermission(); // Kullanıcıdan bildirim izni isteniyor

  if (permissionGranted) {
    // İzin verildiyse servisi başlat
    await notificationService.initialize();
  } else {
    // İzin verilmediğinde kullanıcıyı bilgilendir
    print('Bildirim izni verilmedi.');
  }

  // Uygulamayı sadece dikey moda ayarla
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Üst alt bildirim panelleri renk şemaları transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SettingsController _settingscontroller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Languages(), // Dil çevirileri
        localizationsDelegates: const [
          GlobalMaterialLocalizations
              .delegate, // satırlar material hatası için eklendi
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialBinding: AppBinding(),
        supportedLocales: Languages.languageList, // Desteklenen diller
        locale: Get.deviceLocale, // Cihazın dilini al
        fallbackLocale: Languages.defa, // Varsayılan dil
        home: HomeScreen(),
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: _settingscontroller.themeMode.value,
      );
    });
  }
}


// *** EĞER EN BAŞTA BİLDİRİM İZNİ İSTENECEKSE MAIN DE BUNU KULLAN ***
// final NotificationService notificationService = NotificationService();

//   // Bildirim iznini kontrol et
//   bool permissionGranted =
//       await notificationService.requestNotificationPermission();

//   if (permissionGranted) {
//     await notificationService.initialize(); // Servisi başlat
//   } else {
//     // İzin verilmediğinde kullanıcıyı bilgilendir
//     print('Bildirim izni verilmedi.');
//   }