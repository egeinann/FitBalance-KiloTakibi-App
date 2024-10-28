import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/graphs_controller.dart';
import 'package:kilo_takibi_uyg/models/record.dart'; // model parametreleri ile ilgili hata alıyorsan... model sınıfı eklenmeli
import 'package:kilo_takibi_uyg/widgets/record_list_tile.dart';

class Controller extends GetxController {
  final GraphsController _graphsController = Get.find();
  RxList<Record> records = <Record>[].obs; // record objeleri tutan liste
  RxBool isLoading = false.obs; // loading lottie için
  final GlobalKey<AnimatedListState> listKey =
      GlobalKey<AnimatedListState>(); // liste animasyonu için
  var photoUrl = Rxn<String>(); // Reaktif bir değişken
  var currentTabIndex = 2.obs; // homescreen sayfa index
  var appBarTitle = 'Add'.obs; // Başlangıç başlığı
  var graphPageIndex = 0.obs; // ödeme sonrası graphscreen'e geçiş

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
    _graphsController.updateFilteredRecords();
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
    _graphsController.updateFilteredRecords();
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
        _graphsController.updateFilteredRecords();
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
      _graphsController.updateFilteredRecords();
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

  // *** SAYFALAR ARASI BAŞLIK DEĞİŞİMLERİ ***
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
        return 'Add'.tr;
      case 3:
        return 'History'.tr;
      case 4:
        return 'Profile'.tr;
      default:
        return 'App'.tr;
    }
  }

  // *** APPBAR BAŞLIK GÜNCELEME ***
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
    appBarTitle.value = getTitleForIndex(index); // AppBar başlığını güncelle
  }

  // *** AYNI TARİHTE RECORD VAR MI KONTROLÜ ***
  bool isRecordExists(DateTime date) {
    return records.any((record) => record.dateTime == date);
  }

  // *** NAVBAR GALLERYSCREEN YÖNLENDİRME ***
  void goToAddScreen() {
    changeTabIndex(2);
  }

  // *** NAVBAR HISTORYSCREEN YÖNLENDİRME ***
  void goToHistoryScreen() {
    changeTabIndex(3);
  }
}
