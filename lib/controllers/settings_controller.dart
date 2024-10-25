import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedGenderRange = [true, false].obs; // cinsiyet toggle buttons
  RxBool activePremium = false.obs; // premiumEnabled
  Rx<ThemeMode> themeMode = ThemeMode.system.obs; // tema durumu
  var selectedLanguage = 'en'.obs; // Varsayılan dil
  
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
  void updateGenderRange(int index) {
    if (index == 0) {
      selectedGenderRange[0] = true;
      selectedGenderRange[1] = false;
    } else {
      selectedGenderRange[0] = false;
      selectedGenderRange[1] = true;
    }
  }

  // *** SWITCH BİLDİRİM DURUMU ***

  // *** TEMA DURUMU DEĞİŞTİRME ***
  void switchTheme(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
