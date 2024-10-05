import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedGenderRange = [true, false].obs; // cinsiyet toggle buttons
  RxBool isNotificationsEnabled = true.obs; // bilidirim durumu
  Rx<ThemeMode> themeMode = ThemeMode.system.obs; // tema durumu
  var selectedLanguage = 'en'.obs; // Varsayılan dil

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

  // *** BİLDİRİMLER SWİTCH YÖNETİMİ ***
  void toggleNotifications(bool isEnabled) {
    isNotificationsEnabled.value = isEnabled;
  }

  // *** TEMA DURUMU DEĞİŞTİRME ***
  void switchTheme(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // *** SEÇİLİ DİL DURUMUNU DEĞİŞTİRME ***
  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode, langCode.toUpperCase())); // Dili güncelle
    print(selectedLanguage.value);
  }
}
