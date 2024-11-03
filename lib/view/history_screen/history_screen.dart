import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/history_screen/fade_no_record.dart';
import 'package:kilo_takibi_uyg/view/history_screen/recordScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.find();
  ScrollController scrollController = ScrollController();
  final GlobalKey<AnimatedListState> historyListKey =
      GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: context.paddingMedium,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Obx(
                () => _controller.records.isEmpty
                    ? const FadeNoRecord()
                    : buildRecords(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int previousRecordLength =
      0; // önceki kayıt uzunluğunu tutuyor rec sayfası düzenleme-silme sonrası scroll sıfırlamaz (yapay zeka ile çözüldü)
  @override
  void initState() {
    super.initState();
    // İlk değerleri al
    previousRecordLength = _controller.records.length;
    // Listen değiştiğinde dinleme yap
    _controller.records.listen((records) {
      if (records.isNotEmpty) {
        // Yeni bir kayıt eklenmişse, listenin uzunluğu artar
        if (records.length > previousRecordLength) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom(); // Sadece kayıt eklendiğinde kaydır
          });
        }
        // Şimdiki liste uzunluğunu güncelle
        previousRecordLength = records.length;
      }
    });
  }

// *** NEW RECORD SCROLL BOTTOM ***
  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // *** BUILD RECORDS LIST ***
  Column buildRecords(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: AnimatedList(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              key: _controller.listKey,
              initialItemCount: _controller.records.length,
              itemBuilder: (context, index, animation) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.recordscreen,
                        arguments: _controller.records[index]),
                    child: _controller.buildItem(
                        _controller.records[index], animation),
                  ),
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: Get.size.width * 0.8,
              child: const Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Text(
                    "${_controller.records.length} ${"Record".tr}", // Burada "Record" kelimesinin çevrildiğinden emin olun.
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  children: [
                    CustomFloatingActionButton(
                      widget: const Icon(Ionicons.search),
                      onPressed: () {
                        _showMonthSelector(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    CustomFloatingActionButton(
                      widget: const Icon(Icons.delete),
                      onPressed: () {
                        deleteAllShowDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // *** SEARH BOTTOM SHEET ***
  void _showMonthSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Month'.tr,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: List.generate(
                    12,
                    (index) {
                      return ListTile(
                        title: Center(
                          child: Text(
                            _getMonthName(index),
                          ),
                        ),
                        onTap: () {
                          // Ay seçimi yapıldığında kaydırma işlemi
                          _scrollToMonth(index + 1); // Seçilen ay için kaydırma
                          Navigator.pop(context); // BottomSheet'i kapat
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // *** bottomsheet için aylar listesi ***
  String _getMonthName(int index) {
    List<String> months = [
      'January'.tr,
      'February'.tr,
      'March'.tr,
      'April'.tr,
      'May'.tr,
      'June'.tr,
      'July'.tr,
      'August'.tr,
      'September'.tr,
      'October'.tr,
      'November'.tr,
      'December'.tr
    ];
    return months[index];
  }

  // *** SEÇİLEN AY İÇİN KAYDIRMA ***
  void _scrollToMonth(int month) {
    // Belirtilen ayda kayıtları filtreleyin
    final monthRecords = _controller.records.where((record) {
      return record.dateTime.month == month;
    }).toList();

    if (monthRecords.isNotEmpty) {
      // Eğer kayıt varsa, ayın ortasını hesapla
      int midIndex =
          monthRecords.length ~/ 2; // Ayın ortasındaki kaydın indeksi
      int index = _controller.records.indexOf(monthRecords[
          midIndex]); // Ay ortasındaki kaydın ana kayıtlar listesindeki indeksi

      // Kayıt yüksekliği ve padding
      double itemHeight = 60.0; // Her bir kaydın yüksekliği
      double paddingVertical = 2.0; // Her bir kaydın dikey padding'i
      double totalItemHeight =
          itemHeight + (paddingVertical * 2); // Toplam kayıt yüksekliği

      // Ortalamak için kaydırma hesaplaması
      double offset =
          (MediaQuery.of(context).size.height / 2) - (totalItemHeight / 2);

      // Kaydırma yap
      scrollController.animateTo(
        index * totalItemHeight -
            offset, // Kayıt yüksekliğine göre kaydırma yap
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeOut,
      );
    } else {
      // Kayıt yoksa bildirim göster
      SnackbarHelper.showSnackbar(
        icon: const Icon(Icons.error),
        title: "No records found for this month".tr,
        message: "Please select a different month.".tr,
        backgroundColor: Colors.orange,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  // *** DELETE SHOW DIALOG ***
  Future<dynamic> deleteAllShowDialog(BuildContext context) {
    return DialogService.deleteShowDialog(
      title: "Delete all records !".tr,
      content: "Are you sure all records will be deleted ?".tr,
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 300), // Kısa bir gecikme ekleyin
          () {
            _controller.deleteAllRecords(_controller.listKey);
            SnackbarHelper.showSnackbar(
              title: "You deleted all records".tr,
              message: "There are no more records".tr,
              backgroundColor: Colors.red,
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(Icons.delete),
            );
          },
        );
      },
    );
  }
}
