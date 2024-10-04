import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedGenderRange = [true, false].obs; // cinsiyet toggle buttons
  RxBool isNotificationsEnabled = true.obs; // bilidirim durumu
  Rx<ThemeMode> themeMode = ThemeMode.system.obs; // tema durumu
  var selectedLanguage = 'en'.obs; // Varsayılan dil İngilizce
  var locale = const Locale('en').obs; // Varsayılan olarak İngilizce

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
  void changeLanguage(String languageCode) {
    switch (languageCode) {
      case 'en':
        locale.value = const Locale('en'); // İngilizce
        break;
      case 'tr':
        locale.value = const Locale("tr"); // Türkçe
        break;
      case 'es':
        locale.value = const Locale('es'); // İspanyolca
        break;
      case 'fr':
        locale.value = const Locale('fr'); // Fransızca
        break;
      case 'de':
        locale.value = const Locale('de'); // Almanca
        break;
      case 'zh':
        locale.value = const Locale('zh'); // Çince
        break;
      default:
        locale.value = const Locale('en'); // Varsayılan dil
    }
  }
}
