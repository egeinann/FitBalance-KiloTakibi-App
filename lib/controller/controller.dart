import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/record_list_tile.dart';

class Controller extends GetxController {
  var photoUrl = Rxn<String>(); // Reaktif bir değişken
  var currentTabIndex = 2.obs; // homescreen sayfa index
  var appBarTitle = 'Add'.obs; // Başlangıç başlığı
  RxList<Record> records = <Record>[].obs; // record objeleri tutan list
  final GlobalKey<AnimatedListState> listKey =
      GlobalKey<AnimatedListState>(); // liste animasyonu için
  RxBool isLoading = false.obs; // loading lottie için

  // yeni record ekleme methodu
  void addRecord(Record record) {
    if (records.isEmpty || record.dateTime.isBefore(records.last.dateTime)) {
      // Yeni öğe ekleme
      records.add(record);
      listKey.currentState?.insertItem(records.length - 1);
    } else {
      double lastWeight = records.last.weight;
      DateTime lastDate = records.last.dateTime;

      // Eksik tarihleri ekleme
      while (lastDate
          .isBefore(record.dateTime.subtract(const Duration(days: 1)))) {
        lastDate = lastDate.add(const Duration(days: 1));
        var newRecord = Record(
          weight: lastWeight,
          dateTime: lastDate,
          note: null,
        );
        records.add(newRecord);
        listKey.currentState?.insertItem(records.length - 1);
      }

      // Yeni kayıt ekleme
      records.add(record);
      listKey.currentState?.insertItem(records.length - 1);
    }
    // İşlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

// mevcut recordu silme methodu
  void deleteRecord(Record record) {
    final int index = records.indexOf(record); // Silinecek öğenin indeksini bul
    if (index == -1) return; // Eğer öğe bulunamazsa hiçbir şey yapma

    // Öğeyi listeden kaldır

    records.removeAt(index);

    // Animasyonla öğeyi kaldır
    listKey.currentState?.removeItem(
      index,
      (context, animation) => buildItem(record, animation),
    );

    // İşlem sonrası grafikleri güncelle
    updateFilteredRecords();
  }

  void deleteAllRecords(GlobalKey<AnimatedListState> listKey) {
    final int itemCount = records.length;

    // Tüm öğeleri animasyonla kaldır
    for (int i = itemCount - 1; i >= 0; i--) {
      final record = records[i];
      listKey.currentState?.removeItem(
        i,
        (context, animation) => buildItem(record, animation),
        duration: const Duration(milliseconds: 300), // Animasyon süresi
      );
    }

    // Tüm kayıtları temizle, animasyonun tamamlanmasını bekleyin
    Future.delayed(
      const Duration(
          milliseconds: 400), // Animasyon süresine eşit veya biraz daha uzun
      () {
        records.clear();
        updateFilteredRecords();
      },
    );
  }

  // updateRecord fonksiyonu
  void updateRecord(Record oldRecord, Record newRecord) {
    var index = records.indexWhere((rec) => rec == oldRecord);
    if (index != -1) {
      records[index] = newRecord;
      records.refresh(); // Listenin UI'ı güncellemesi için refresh kullan
      // işlem sonrası grafikleri güncelle
      updateFilteredRecords();
    }
  }

  Widget buildItem(Record record, Animation<double> animation) {
    final animationCurve = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0), // Sağdan gelme
        end: Offset.zero,
      ).animate(animationCurve),
      child: RecordListTile(rec: record),
    );
  }

  // app bar başlığını güncelleme
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
    appBarTitle.value = getTitleForIndex(index); // AppBar başlığını güncelle
  }

  // Graph pageView index kontrolu
  var graphPageIndex = 0.obs;
  void onPageChanged(int index) {
    graphPageIndex.value = index;
    if (currentTabIndex.value == 0) {
      appBarTitle.value = getTitleForIndex(0);
    }
  }

  // grafikler arası başlık değişimleri
  String getTitleForIndex(int index) {
    switch (index) {
      case 0:
        if (records.length < 7) {
          return "Graph";
        } else {
          switch (graphPageIndex.value) {
            case 0:
              return "Line Graph";
            case 1:
              return "Bar Graph";
            default:
              return "Error Graph";
          }
        }
      case 1:
        return 'Gallery';
      case 2:
        return 'Add';
      case 3:
        return 'History';
      case 4:
        return 'Profile';
      default:
        return 'App';
    }
  }

  // Aynı tarihte kayıt var mı kontrolü
  bool isRecordExists(DateTime date) {
    return records.any((record) => record.dateTime == date);
  }

  // navigationbar gallery ye yönlendir
  void goToAddScreen() {
    changeTabIndex(2);
  }

  // navigationbar history ye yönlendir
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

  // Record'un fotoğrafını kaldırma fonksiyonu
  void removePhoto(Record record) {
    int index = records.indexOf(record);
    if (index != -1) {
      records[index] = records[index].copyWith(photoUrl: null);
      update(); // Kayıtları günceller
    }
  }
}
