import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isMale = true.obs; // cinsiyet seçimi varsayılan erkek
  RxBool activePremium = false.obs; // premiumEnabled
  Rx<ThemeMode> themeMode = ThemeMode.system.obs; // tema durumu
  var selectedLanguage = 'en'.obs; // Varsayılan dil
  var isKgSelected = true.obs; // ağırlık birimi seçimi varsayılan kg

  // Dil seçenekleri haritası
  final languageOptions = {
    'tr': 'Türkçe',
    'en': 'English',
    'es': 'Español',
    'fr': 'Français',
    'de': 'Deutsch',
    'pt': 'Português',
    'zh': '中国人',
  };

  @override
  void onInit() {
    // Cihaz dilini kontrol et ve desteklenen dillerden biriyse onu kullan
    final deviceLocale = Get.deviceLocale?.languageCode ?? 'en';
    if (languageOptions.containsKey(deviceLocale)) {
      selectedLanguage.value = deviceLocale;
      Get.updateLocale(Locale(deviceLocale));
    }
    super.onInit();
  }

  // *** SEÇİLİ DİL DURUMUNU DEĞİŞTİRME ***
  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode));
  }

  // *** CİNSİYET TOGGLE BUTTONLAR DEĞİŞİMİ ***
  void toggleGender(int index) {
    isMale.value = !isMale.value;
  }

  // *** TEMA DURUMU DEĞİŞTİRME ***
  void switchTheme(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // *** KİLO BİRİMİ TOGGLE BUTTONS ***
  void toggleUnit() {
    isKgSelected.value = !isKgSelected.value;
  }
}
