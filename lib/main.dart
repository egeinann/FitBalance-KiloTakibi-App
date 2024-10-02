import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/appCustoms/themes.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kilo_takibi_uyg/view/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Uygulamayı sadece dikey moda ayarla
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Üst alt bildirim panelleri renk şemaları transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: _controller.locale.value,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: _controller.themeMode.value,
      );
    });
  }
}

// flutter pub run intl_utils:generate