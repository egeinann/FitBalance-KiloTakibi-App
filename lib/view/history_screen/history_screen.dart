import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
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
                    ? const FadeNoRecord() // Animasyonlu boş ekran widget'ı
                    : buildRecords(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.records.listen((records) {
      if (records.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
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
                  child: InkWell(
                    onTap: () => Get.to(
                        RecordScreen(rec: _controller.records[index]),
                        transition: Transition.rightToLeftWithFade),
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
                    "${_controller.records.length} record",
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

  // *** BOTTOM SHEET AÇMA ***
  void _showMonthSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Month',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: List.generate(12, (index) {
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
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getMonthName(int index) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
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
        title: "No records found for this month",
        message: "Please select a different month.",
        backgroundColor: Colors.orange,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  // *** DELETE SHOW DIALOG ***
  Future<dynamic> deleteAllShowDialog(BuildContext context) {
    return DialogService.deleteShowDialog(
      title: "Delete all records !",
      content: "Are you sure all records will be deleted ?",
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 300), // Kısa bir gecikme ekleyin
          () {
            _controller.deleteAllRecords(_controller.listKey);
            SnackbarHelper.showSnackbar(
              title: "You deleted all records",
              message: "There are no more records",
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
