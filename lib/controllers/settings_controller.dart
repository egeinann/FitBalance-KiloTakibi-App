import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';

class SettingsController extends GetxController {
  final Controller controller = Get.find(); // Controller'a erişim
  var isMale = true.obs; // cinsiyet seçimi varsayılan erkek
  Rx<ThemeMode> themeMode = ThemeMode.system.obs; // tema durumu
  var selectedLanguage = 'en'.obs; // Varsayılan dil
  var isKgSelected = true.obs; // ağırlık birimi seçimi varsayılan kg
  var isCmSelected = true.obs; // yükseklik birimi seçimi varsayılan cm
  String get weightUnit => isKgSelected.value ? 'kg'.tr : 'lbs'.tr;
  String get heightUnit => isCmSelected.value ? 'cm'.tr : 'ft'.tr;
  var hasPaid = false.obs; // grafik ödeme durumu
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
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    themeMode.value =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
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
  void toggleWeightUnit() {
    isKgSelected.value = !isKgSelected.value;

    // Iterate through all records and convert their weight
    for (var i = 0; i < controller.records.length; i++) {
      final rec = controller.records[i];
      final updatedWeight = isKgSelected.value
          ? (rec.weight / 2.20462).toPrecision(1) // Convert from Lbs to Kg
          : (rec.weight * 2.20462).toPrecision(1); // Convert from Kg to Lbs

      // Update the record with the new weight using copyWith
      final updatedRecord = rec.copyWith(weight: updatedWeight);

      // Update the record in the list
      controller.records[i] = updatedRecord;
    }

    // weight kısmı için convert
    controller.selectedValue.value = isKgSelected.value
        ? (controller.selectedValue.value / 2.20462)
            .toPrecision(1) // Convert to Kg
        : (controller.selectedValue.value * 2.20462)
            .toPrecision(1); // Convert to Lbs

    // targetWeight kısmı için convert
    controller.targetWeight.value = isKgSelected.value
        ? (controller.targetWeight.value / 2.20462).toPrecision(1)
        : (controller.targetWeight.value * 2.20462).toPrecision(1);

    controller.updateFilteredRecords();
    update();
  }

  // *** YÜKSEKLİK BİRİMİ TOGGLE BUTTONS ***
  void toggleHeightUnit(double height) {
    isCmSelected.value = !isCmSelected
        .value; // Yükseklik birimini değiştirmek için isCmSelected'i tersine çeviriyoruz

    // Yükseklik dönüşümünü yap
    isCmSelected.value
        ? (height * 30.48).toPrecision(1) // Ft to Cm dönüşümü
        : (height / 30.48).toPrecision(1); // Cm to Ft dönüşümü
    update();
  }

  // *** PREMIUM ÖDEME İŞLEMİ İŞLEMİ ***
  void completePayment() {
    hasPaid.value = true; // hasPaid durumunu true yapar
  }
}
