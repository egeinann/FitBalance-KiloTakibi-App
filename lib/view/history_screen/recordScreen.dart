import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record_model/record.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_weight.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';
import 'package:lottie/lottie.dart';

class RecordScreen extends GetView<Controller> {
  final SettingsController _settingsController = Get.find();
  RecordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Record rec =
        Get.arguments as Record; // Get.arguments ile rec değerini alıyoruz
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat("d MMMM, y", Get.locale.toString()).format(rec.dateTime),
          style: Get.theme.textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDeleteConfirmation(rec);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: context.paddingLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildWeight(context, rec),
              buildNote(context, rec),
              buildPhoto(rec),
            ],
          ),
        ),
      ),
      floatingActionButton: editActionButton(context, rec),
    );
  }

  // *** EDIT BUTTON ***
  Widget editActionButton(BuildContext context, Record rec) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 5),
      child: customFloatingActionButton(
        heroTag: "_editButton",
        widget: const Icon(Icons.draw),
        onPressed: () {
          _showEditModalBottomSheet(context, rec);
        },
      ),
    );
  }

  // *** WEIGHT ***
  Widget buildWeight(BuildContext context, Record rec) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.paddingLow,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/recordScreenAnimated.json',
              fit: BoxFit.scaleDown,
            ),
            Hero(
              tag:
                  "${rec.weight}_${rec.dateTime.toIso8601String()}_weight", // Tarih ve kilo kombinasyonu
              child: Stack(
                children: [
                  // Kenarlık (dış) metin
                  Text(
                    '${rec.weight} ${_settingsController.weightUnit}',
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.black, // Kenarlık rengi
                    ),
                  ),
                  // İç metin
                  Text(
                    '${rec.weight} ${_settingsController.weightUnit}',
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Colors.white, // Metin içi beyaz renk
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *** NOTE ***
  Widget buildNote(BuildContext context, Record rec) {
    if (rec.note != null && rec.note!.isNotEmpty) {
      return Padding(
        padding: context.paddingLow,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.theme.canvasColor.withOpacity(0.5),
          ),
          child: Text(
            rec.note!,
            style: Get.theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  // *** PHOTO ***
  Widget buildPhoto(Record rec) {
    if (rec.photoUrl != null && rec.photoUrl!.isNotEmpty) {
      return Expanded(
        flex: 5,
        child: (rec.photoUrl!.startsWith('file://'))
            ? const SizedBox()
            : Center(
                child: Stack(
                  children: [
                    Container(
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: Image(
                          image: FileImage(
                            File(rec.photoUrl!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Ionicons.close,
                            color: Colors.white),
                        onPressed: () {
                          showDeletePhoto(rec);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      );
    } else {
      return Expanded(flex: 4, child: Center(child: Text("No photo !".tr)));
    }
  }

  // *** edit model bottom sheet  ***
  void _showEditModalBottomSheet(BuildContext context, Record rec) {
    double selectedValue = rec.weight;
    String? note = rec.note;
    TextEditingController noteController = TextEditingController(text: note);

    Get.bottomSheet(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            reverse: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat("d MMM, y", Get.locale.toString())
                          .format(rec.dateTime),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    NumberPickerWeight(
                      isKgSelected: _settingsController.isKgSelected,
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: noteController,
                      labelText: "note".tr,
                      onChanged: (value) {
                        note = value;
                      },
                      titleIcon: IconButton(
                        onPressed: () {
                          noteController.clear(); // TextField'ı sıfırla
                          note = ""; // note değişkenini de sıfırla
                        },
                        icon: const Icon(Icons.backspace),
                      ),
                      maxLength: 80,
                    ),
                    const SizedBox(height: 10),
                    customFloatingActionButton(
                      heroTag: "_editButton",
                      widget: Text(
                        "Save".tr,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        onPressedSave(
                            context, selectedValue, note, noteController, rec);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }

  // *** editActionButton save ***
  void onPressedSave(BuildContext context, double selectedValue, String? note,
      TextEditingController noteController, Record rec) {
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        Get.focusScope?.unfocus();
        Get.back();
      },
    );

    controller.updateRecord(
      rec,
      Record(
        weight: selectedValue,
        note: note,
        dateTime: rec.dateTime,
        photoUrl: rec.photoUrl,
      ),
    );
    noteController.clear();
    Future.delayed(const Duration(milliseconds: 600), () {
      Get.back();
      SnackbarHelper.showSnackbar(
          title: "Record updated".tr,
          message: DateFormat("d MMMM, y", Get.locale.toString())
              .format(rec.dateTime),
          backgroundColor: Colors.green,
          duration: const Duration(milliseconds: 1500),
          icon: const Icon(Icons.save));
    });
  }

  // *** RECORD DELETE SHOW DIALOG ***
  Future<dynamic> showDeleteConfirmation(Record rec) {
    return DialogService.deleteShowDialog(
      title: "Delete Record".tr,
      content: "Are you sure you want to delete this record ?".tr,
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 200),
          () {
            Get.back(); // dialogu kapat
            controller.goToHistoryScreen(); // Geçiş yap
            controller.deleteRecord(rec); // Kayıt silme işlemi
          },
        );
      },
    );
  }

  // *** PHOTO DELETE SHOW DIALOG ***
  Future<dynamic> showDeletePhoto(Record rec) {
    return DialogService.deleteShowDialog(
      title: "Delete Photo".tr,
      content: "Are you sure you want to delete this photo ?".tr,
      onCancel: () {},
      onConfirm: () {
        controller.removePhoto(rec);
        Get.back();
        controller.goToHistoryScreen();
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            Get.back();
            SnackbarHelper.showSnackbar(
                title: "Record updated".tr,
                message: DateFormat("d MMMM, y", Get.locale.toString())
                    .format(rec.dateTime),
                backgroundColor: Colors.green,
                duration: const Duration(milliseconds: 1500),
                icon: const Icon(Icons.camera_alt));
          },
        );
      },
    );
  }
}
