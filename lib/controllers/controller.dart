import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/models/record_model/record.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/record_list_tile.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';

class Controller extends GetxController {
  final UserController _userController = Get.find();
  final PageController pageController =
      PageController(); // grafik aşağı yukarı page controller
  RxList<Record> records = <Record>[].obs; // record objeleri tutan liste
  var filteredRecords =
      <Record>[].obs; // filtrelenmiş grafik kayıtlarını tutan liste
  RxBool isLoading = false.obs; // loading lottie için
  final ScrollController scrollController =
      ScrollController(); // HİSTORY SCROLL CONTROLLER
  final GlobalKey<AnimatedListState> listKey =
      GlobalKey<AnimatedListState>(); // liste animasyonu için
  var photoUrl = Rxn<String>(); // Reaktif bir değişken
  var currentTabIndex = 2.obs; // MainSreen sayfa index
  var appBarTitle = 'Home'.obs; // Başlangıç başlığı
  var selecedAllTimeGraph =
      true.obs; // grafik zaman dilimi filtreleme (all & 30days)
  var showDotData = false.obs; // grafik, basılı tutunca data noktalarını göster
  var graphPageIndex = 0.obs; // ödeme sonrası graphscreen'e geçiş
  var currentWeight = 70.0.obs; // Seçilen ağırlık
  var selectedDate = DateTime.now().obs; // Seçilen tarih
  var note = ''.obs; // Not
  final TextEditingController noteController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  var targetAchieved = false.obs; // hedef kiloya ulaşıldı mı

  // Hedefe ulaşılıp ulaşılmadığını kontrol eden fonksiyon
  void checkTargetAchieved() {
    const double tolerance = 1.0; // 1 kilogramlık tolerans
    targetAchieved.value =
        (currentWeight.value - _userController.user.value.targetWeight).abs() <=
            tolerance;
  }

  // *** RECORD EKLE ***
  void addRecord(Record newRecord) {
    // Aynı tarihli kayıt var mı kontrol et
    final existingIndex = records.indexWhere(
      (r) => r.dateTime.isAtSameMomentAs(newRecord.dateTime),
    );

    if (existingIndex != -1) {
      // Aynı tarihli kayıt varsa kullanıcıya bilgi ver
      SnackbarHelper.showSnackbar(
        title: "There is already a record for the same date".tr,
        message: "Change the date".tr,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(AppIcons.calendar),
      );
      return;
    }

    // Yeni kaydı eklemek için doğru yeri bul
    final insertIndex = records.indexWhere(
      (r) => r.dateTime.isAfter(newRecord.dateTime),
    );

    if (insertIndex == -1) {
      // Eğer daha sonraki bir tarih bulunamazsa listenin sonuna ekle
      records.add(newRecord);
      listKey.currentState?.insertItem(records.length - 1);
    } else {
      // Eğer araya eklenmesi gerekiyorsa belirtilen indekse ekle
      records.insert(insertIndex, newRecord);
      listKey.currentState?.insertItem(insertIndex);
    }

    // Listeyi tarihe göre sırala ve yenile (RxList)
    records.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    records.refresh();

    updateFilteredRecords(); // Grafik ve listeyi güncelleme

    // UI temizleme ve geri gitme işlemleri
    noteController.clear(); // Not alanını temizle
    photoUrl.value = null; // Fotoğraf URL'sini sıfırla
    Get.focusScope?.unfocus();
    Get.back();

    // Geçiş sonrası animasyonlu geçiş ekranına yönlendir
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.toNamed(Routes.animationbackgroundscreen);
    });
    goToHistoryScreen(); // Tarihli kayıtları göster (HistoryScreen'e git)
    scrollToBottom(); // scrollu aşağı kaydır
  }

  // ***YENİ KAYIT EKLENDİĞİNDE EN ALTA KAYDIR ***
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

// *** ÖDEME SONRASI GRAPHSCREEN GEÇİŞ KONTROLU ***
  void onPageChanged(int index) {
    graphPageIndex.value = index;
    if (currentTabIndex.value == 0) {
      appBarTitle.value = getTitleForIndex(0);
    }
  }

  // *** APPBAR BAŞLIK GÜNCELEME ***
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
    appBarTitle.value = getTitleForIndex(index); // AppBar başlığını güncelle
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

  // *** GRAFİK İÇİN FİLTRELENMİŞ KAYITLAR (ALL & LAST 30 DAYS) ***
  void updateFilteredRecords() {
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 26));
    if (selecedAllTimeGraph.value) {
      filteredRecords.assignAll(records); // Tüm kayıtları yükle
    } else {
      final filtered = records.where((record) {
        final isRecent = record.dateTime.isAfter(thirtyDaysAgo);
        return isRecent;
      }).toList();
      filteredRecords.assignAll(filtered); // Filtrelenen kayıtları yükle
    }
  }

// *** LINEGRAPH ZAMANDİLİMİ TOGGLE BUTTONLARIN DEĞİŞİMİ ***
  void timeUnit(int index) {
    // Burada, index 0 ise tüm kayıtlar gösterilecek, 1 ise son 30 gün gösterilecek
    selecedAllTimeGraph.value = index ==
        0; // Eğer index 0 ise, tüm kayıtlar gösterilir, değilse son 30 gün
    updateFilteredRecords();
  }

  // *** ÇİZGİ GRAFİĞİ DATA NOKTALARINI GÖSTERİR ***
  void dotData(bool value) {
    showDotData.value = value;
  }
}
