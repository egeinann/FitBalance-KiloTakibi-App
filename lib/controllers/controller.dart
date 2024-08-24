import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class Controller extends GetxController {
  // record objeleri tutan list
  RxList<Record> records = <Record>[].obs;

  // yeni record ekleme methodu
  void addRecord(Record record) {
    if (records.isEmpty || record.dateTime.isBefore(records.last.dateTime)) {
      records.add(record);
    } else {
      double lastWeight = records.last.weight;
      DateTime lastDate = records.last.dateTime;

      while (lastDate
          .isBefore(record.dateTime.subtract(const Duration(days: 1)))) {
        lastDate = lastDate.add(const Duration(days: 1));
        records.add(Record(
          weight: lastWeight,
          dateTime: lastDate,
          note: null,
        ));
      }

      records.add(record);
    }
    // işlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

  // mevcut recordu silme methodu
  void deleteRecord(Record record) {
    records.remove(record);
    // işlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

  // tüm record listesini sil temizle
  void deleteAllRecords() {
    records.clear();
    // işlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

  // Aynı tarihte kayıt var mı kontrolü
  bool isRecordExists(DateTime date) {
    return records.any((record) => record.dateTime == date);
  }

  // bottom bar için index değişimleri
  var currentTabIndex = 2.obs;
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }

  // kayıtları güncelleme işlemi
  void updateRecord(Record oldRecord, Record newRecord) {
    records[records.indexWhere((element) => element == oldRecord)] = newRecord;
    // işlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

  // tab bar index 1 ye yönlendir
  void goToAddScreen() {
    changeTabIndex(2);
  }

  // tab bar index 2 ye yönlendir
  void goToHistoryScreen() {
    changeTabIndex(3);
  }

  // tema yönetimi
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void switchTheme(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // bildirimler switch yönetimi
  RxBool isNotificationsEnabled = true.obs;
  void toggleNotifications(bool isEnabled) {
    isNotificationsEnabled.value = isEnabled;
  }

  // Şu anki dil
  RxString selectedLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    // Varsayılan dili ayarlayın
    selectedLanguage.value = Get.locale?.languageCode ?? 'en';
  }

  // Uygulama dilini güncelle
  void changeLanguage(String locale) {
    selectedLanguage.value = locale;
    Get.updateLocale(Locale(locale));
  }

  // Bar grafiği için aylık ortalamaları hesaplama
  Map<String, double> calculateMonthlyAverages() {
    final Map<String, List<double>> monthlyWeights = {};

    for (var record in records) {
      final monthYear = '${record.dateTime.year}-${record.dateTime.month}';
      if (monthlyWeights.containsKey(monthYear)) {
        monthlyWeights[monthYear]!.add(record.weight);
      } else {
        monthlyWeights[monthYear] = [record.weight];
      }
    }

    final Map<String, double> monthlyAverages = {};
    monthlyWeights.forEach((monthYear, weights) {
      final averageWeight = weights.reduce((a, b) => a + b) / weights.length;
      monthlyAverages[monthYear] = averageWeight;
    });

    return monthlyAverages;
  }

// Filtrelenmiş kayıtları tutan liste
  RxList<Record> filteredRecords = <Record>[].obs;

  // Grafik Toggle butonları durumu
  var selectedTimeRange = [true, false].obs;
  // Filtrelenmiş kayıtları güncelleyen method
  void updateFilteredRecords() {
    if (selectedTimeRange[1]) {
      // Son 30 kaydı al ve tarihe göre doğru sırala
      List<Record> recordsList = records.toList(); // Convert RxList to List
      recordsList.sort((a, b) =>
          a.dateTime.compareTo(b.dateTime)); // Sort by dateTime ascending
      int itemCount = recordsList.length < 30 ? recordsList.length : 30;
      filteredRecords.assignAll(recordsList
          .sublist(recordsList.length - itemCount)); // Update filteredRecords
    } else {
      // Tüm kayıtları göster
      filteredRecords.assignAll(records);
    }
  }
  // Toggle buton durumu değiştiğinde çağrılan method
  void updateTimeRange(int index) {
    for (int i = 0; i < selectedTimeRange.length; i++) {
      selectedTimeRange[i] = i == index;
    }
    updateFilteredRecords();
  }

  // Cinsiyet Toggle butonların durumu
  var selectedGenderRange = [true, false].obs;
  void updateGenderRange(int index) {
    if (index == 0) {
      selectedGenderRange[0] = true;
      selectedGenderRange[1] = false;
    } else {
      selectedGenderRange[0] = false;
      selectedGenderRange[1] = true;
    }
  }

  // Graph pageView index kontrolu
  var graphPageIndex = 0.obs;
  void onPageChanged(int index) {
    graphPageIndex.value = index;
  }
}
