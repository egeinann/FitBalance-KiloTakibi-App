import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/bottom_sheet.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/divider.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/view/history_screen/fade_no_record.dart';

class HistoryScreen extends StatelessWidget {
  final Controller _controller = Get.find();

  HistoryScreen({super.key});

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
                    : buildRecords(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildRecords() {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: AnimatedList(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: _controller.scrollController,
              key: _controller.listKey,
              initialItemCount:
                  _controller.records.length, // Initial item count doğru
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
              child: const CustomDivider(),
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
                    color: Get.theme.cardColor,
                  ),
                  child: Text(
                    "${_controller.records.length} ${"Record".tr}",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                Row(
                  children: [
                    customFloatingActionButton(
                      mini: true,
                      widget: const Icon(AppIcons.search),
                      onPressed: () {
                        BottomSheetHelper.showCustomBottomSheet(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Select Month'.tr,
                                style: Get.textTheme.labelSmall,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: Get.size.height *
                                    0.3, // Listenin yüksekliğini belirleyin
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 12,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      enableFeedback: true,
                                      title: Center(
                                        child: Text(
                                          _getMonthName(index),
                                          style: Get.textTheme.bodyMedium,
                                        ),
                                      ),
                                      onTap: () {
                                        Get.back();
                                        _scrollToMonth(index + 1);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          color: Get.theme.canvasColor,
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    customFloatingActionButton(
                      mini: true,
                      widget: const Icon(AppIcons.delete),
                      onPressed: deleteAllShowDialog,
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

  // *** AYLAR LİSTESİ ***
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

  // *** KAYDIRMA İŞLEMİ FONKSİYONU ***
  void _scrollToMonth(int month) {
    final monthRecords = _controller.records.where((record) {
      return record.dateTime.month == month;
    }).toList();

    if (monthRecords.isNotEmpty) {
      int midIndex = monthRecords.length ~/ 2;
      int index = _controller.records.indexOf(monthRecords[midIndex]);

      double itemHeight = 60.0;
      double paddingVertical = 2.0;
      double totalItemHeight = itemHeight + (paddingVertical * 2);

      double offset = (Get.height / 2) - (totalItemHeight / 2);

      _controller.scrollController.animateTo(
        index * totalItemHeight - offset,
        duration:
            const Duration(milliseconds: 500), // Daha kısa animasyon süresi
        curve: Curves.easeOut,
      );
    } else {
      SnackbarHelper.showSnackbar(
        icon: const Icon(AppIcons.alert),
        title: "No records found for this month".tr,
        message: "Please select a different month.".tr,
        backgroundColor: Colors.orange,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  // *** TÜM KAYITLARI SİL SHOWDIALOG ***
  Future<dynamic> deleteAllShowDialog() {
    return DialogService.deleteShowDialog(
      title: "Delete all records !".tr,
      content: "Are you sure all records will be deleted ?".tr,
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            _controller.deleteAllRecords(_controller.listKey);
            SnackbarHelper.showSnackbar(
              title: "You deleted all records".tr,
              message: "There are no more records".tr,
              backgroundColor: Colors.red,
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(AppIcons.delete),
            );
          },
        );
      },
    );
  }
}
