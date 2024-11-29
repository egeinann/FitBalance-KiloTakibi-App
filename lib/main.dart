import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/themes.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/language/language.dart';
import 'package:kilo_takibi_uyg/routes/pages.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter motorunu başlat
  // Uygulama açılırken splash ekranı için gerekli komut
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
  Get.lazyPut(() => SettingsController());
  Get.put(Controller());
  runApp(const MyApp());
}

class MyApp extends GetView<SettingsController> {
  const MyApp({super.key});
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
        initialRoute: Routes.mainscreen, // app başlangıç sayfası
        getPages: AppPages.pages, // app sayfalar listesi
        supportedLocales: Languages.languageList, // Desteklenen diller
        locale: Get.deviceLocale, // Cihazın dilini al
        fallbackLocale: Languages.defa, // Varsayılan dil
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: controller.themeMode.value,
      );
    });
  }
}
