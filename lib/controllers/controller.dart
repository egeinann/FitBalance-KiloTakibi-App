import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/record_list_tile.dart';

class Controller extends GetxController {
  RxList<Record> records = <Record>[].obs; // record objeleri tutan liste
  RxBool isLoading = false.obs; // loading lottie için
  RxList<Record> filteredRecords = <Record>[]
      .obs; // filtrelenmiş grafik zaman dilimi kayıtlarını tutan liste

  final GlobalKey<AnimatedListState> listKey =
      GlobalKey<AnimatedListState>(); // liste animasyonu için
  var photoUrl = Rxn<String>(); // Reaktif bir değişken
  var currentTabIndex = 2.obs; // MainSreen sayfa index
  var appBarTitle = 'Add'.obs; // Başlangıç başlığı
  var selecedAllTimeGraph =
      true.obs; // grafik zaman dilimi filtreleme (all & 30days)
  var graphPageIndex = 0.obs; // ödeme sonrası graphscreen'e geçiş
  var selectedValue = 40.0.obs; // Seçilen ağırlık
  var selectedDate = DateTime.now().obs; // Seçilen tarih
  var note = ''.obs; // Not
  var userName = ''.obs; // kullanıcı adı
  var targetWeight = 70.0.obs; // hedef kilo
  final RxString temporaryUserName =
      ''.obs; // profil ekranı için name değiştirme
  final ScrollController scrollController =
      ScrollController(); // HİSTORY SCROLL CONTROLLER
  // *** NAME değişkenini TUTAN FONK ***
  void setUserName(String name) {
    userName.value = name;
  }

  // HEDEF KILO TUTAN FONK ***
  void setTargetWeight(double weight) {
    targetWeight.value = weight;
  }

  // *** RECORD EKLEME İŞLEMİ ***
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

    // Yeni eklenen kayıttan sonra en alta kaydırma işlemi
    scrollToBottom();
  }

  // ***YENİ KAYIT EKLENDİĞİND EN ALTA KAYDIR ***
  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

// *** RECORD SİLME İŞLEMİ ***
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

  // *** TÜM RECORDLARI SİLME İŞLEMİ ***
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
          milliseconds:
              400), // bir üstteki duration animasyon süresine eşit veya daha uzun
      () {
        records.clear();
        updateFilteredRecords();
      },
    );
  }

  // *** RECORD GÜNCELLEME İŞLEMİ ***
  void updateRecord(Record oldRecord, Record newRecord) {
    var index = records.indexWhere((rec) => rec == oldRecord);
    if (index != -1) {
      records[index] = newRecord;
      records.refresh(); // Listenin UI'ı güncellemesi için refresh kullan
      // işlem sonrası grafikleri güncelle
      updateFilteredRecords();
    }
  }

  // *** RECORD FOTOĞRAF KALDIRMA İŞLEMİ ***
  void removePhoto(Record record) {
    int index = records.indexOf(record);
    if (index != -1) {
      records[index] = records[index].copyWith(photoUrl: null);
      update(); // Kayıtları günceller
    }
  }

  // *** RECORD HISTORYSCREEN LİSTE ANİMASYONU ***
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

  // *** APPBAR BAŞLIK GÜNCELEME ***
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
    appBarTitle.value = getTitleForIndex(index); // AppBar başlığını güncelle
  }

  // *** ÖDEME SONRASI GRAPHSCREEN GEÇİŞ KONTROLU ***
  void onPageChanged(int index) {
    graphPageIndex.value = index;
    if (currentTabIndex.value == 0) {
      appBarTitle.value = getTitleForIndex(0);
    }
  }

  // *** GRAFİKLER ARASI BAŞLIK DEĞİŞİMLERİ ***
  String getTitleForIndex(int index) {
    switch (index) {
      case 0:
        if (records.length < 7) {
          return "Graph".tr;
        } else {
          switch (graphPageIndex.value) {
            case 0:
              return "Line Graph".tr;
            case 1:
              return "Bar Graph".tr;
            default:
              return "Error Graph".tr;
          }
        }
      case 1:
        return 'Gallery'.tr;
      case 2:
        return 'Home'.tr;
      case 3:
        return 'History'.tr;
      case 4:
        return 'Profile'.tr;
      default:
        return 'App'.tr;
    }
  }

  // *** AYNI TARİHTE RECORD VAR MI KONTROLÜ ***
  bool isRecordExists(DateTime date) {
    return records.any((record) => record.dateTime == date);
  }

  // *** NAVBAR GALLERYSCREEN YÖNLENDİRME ***
  void goToHomeScreen() {
    changeTabIndex(2);
  }

  // *** NAVBAR HISTORYSCREEN YÖNLENDİRME ***
  void goToHistoryScreen() {
    changeTabIndex(3);
  }

  // *** BAR GRAPH AYLIK ORTALAMA HESAPLAMA ***
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

  // *** GRAFİK İÇİN FİLTRELENMİŞ KAYITLAR (ALL & 30DAYS) ***
  void updateFilteredRecords() {
    if (!selecedAllTimeGraph.value) {
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

  // *** LINEGRAPH ZAMANDİLİMİ TOGGLE BUTTONLARIN DEĞİŞİMİ ***
  // *** LINEGRAPH ZAMANDİLİMİ TOGGLE BUTTONLARIN DEĞİŞİMİ ***
  void timeUnit(int index) {
    selecedAllTimeGraph.value = !selecedAllTimeGraph.value;
    updateFilteredRecords();
  }
}
