import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class GraphsController extends GetxController {
  final Controller _controller = Get.find();
  var hasPaid = false.obs; // grafik ödeme durumu
  RxList<Record> filteredRecords = <Record>[]
      .obs; // filtrelenmiş grafik zaman dilimi kayıtlarını tutan liste
  var selecedAllTimeGraph =
      true.obs; // grafik zaman dilimi filtreleme (all & 30days)
  // *** LINEGRAPH ZAMANDİLİMİ TOGGLE BUTTONLARIN DEĞİŞİMİ ***
  void timeUnit(int index) {
    selecedAllTimeGraph.value = !selecedAllTimeGraph.value;
    updateFilteredRecords();
  }

  // *** GRAFİK İÇİN FİLTRELENMİŞ KAYITLAR (ALL & 30DAYS) ***
  void updateFilteredRecords() {
    if (!selecedAllTimeGraph.value) {
      // Son 30 kaydı al ve tarihe göre doğru sırala
      List<Record> recordsList =
          _controller.records.toList(); // Global controller'dan kayıtları al
      recordsList.sort((a, b) =>
          a.dateTime.compareTo(b.dateTime)); // Sort by dateTime ascending
      int itemCount = recordsList.length < 30 ? recordsList.length : 30;
      filteredRecords.assignAll(recordsList
          .sublist(recordsList.length - itemCount)); // Update filteredRecords
    } else {
      // Tüm kayıtları göster
      filteredRecords.assignAll(_controller.records);
    }
  }

  // *** BAR GRAPH AYLIK ORTALAMA HESAPLAMA ***
  Map<String, double> calculateMonthlyAverages() {
    final Map<String, List<double>> monthlyWeights = {};

    for (var record in _controller.records) {
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

  // *** GRAFİK ÖDEME İŞLEMİ ***
  void completePayment() {
    hasPaid.value = true; // hasPaid durumunu true yapar
  }

  // *** ÖDEME SONRASI GRAPHSCREEN GEÇİŞ KONTROLU ***
  void onPageChanged(int index) {
    _controller.graphPageIndex.value = index;
    if (_controller.currentTabIndex.value == 0) {
      _controller.appBarTitle.value = _controller.getTitleForIndex(0);
    }
  }
}
