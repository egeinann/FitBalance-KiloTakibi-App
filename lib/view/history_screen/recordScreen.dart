import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';
import 'package:lottie/lottie.dart';

class RecordScreen extends StatelessWidget {
  final Record rec;
  RecordScreen({super.key, required this.rec});
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat("d MMMM, y").format(rec.dateTime),
          style: Theme.of(context).textTheme.bodyLarge,
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
              buildWeight(context),
              buildNote(context),
              buildPhoto(),
            ],
          ),
        ),
      ),
      floatingActionButton: editActionButton(context),
    );
  }

  // *** EDIT BUTTON ***
  Widget editActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: CustomFloatingActionButton(
        heroTag: "${rec.photoUrl}_editButton",
        widget: const Icon(Icons.draw),
        onPressed: () {
          _showEditModalBottomSheet(context);
        },
      ),
    );
  }

  // *** WEIGHT ***
  Widget buildWeight(BuildContext context) {
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
                    '${rec.weight} kg',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black, // Kenarlık rengi
                        ),
                  ),
                  // İç metin
                  Text(
                    '${rec.weight} kg',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Colors.pink,
                                Colors.pink,
                                Colors.orange,
                                Colors.orange,
                                Colors.orange,
                                Colors.pink, // Birinci renk
                                Colors.orange, // İkinci renk
                              ],
                            ).createShader(const Rect.fromLTWH(
                                0, 0, 200, 70)), // Boyutları ayarlayın
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
  Widget buildNote(BuildContext context) {
    if (rec.note != null && rec.note!.isNotEmpty) {
      return Padding(
        padding: context.paddingLow,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(5),
            ),
            color: Theme.of(context).canvasColor,
          ),
          child: Text(
            rec.note!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  // *** PHOTO ***
  Widget buildPhoto() {
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
                            color: Colors.red, size: 40),
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
      return const Expanded(flex: 4, child: Center(child: Text("No photo !")));
    }
  }

  // *** edit model bottom sheet  ***
  void _showEditModalBottomSheet(BuildContext context) {
    double selectedValue = rec.weight;
    String? note = rec.note;
    TextEditingController noteController = TextEditingController(text: note);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: 10,
                  right: 10,
                  left: 10,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Text(
                      DateFormat("d MMM, y").format(rec.dateTime),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Edit Record",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Get.size.height * 0.01),
                        Numbers(
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                        SizedBox(height: Get.size.height * 0.01),
                        CustomTextField(
                          controller: noteController,
                          labelText: "note",
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
                        SizedBox(height: Get.size.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFloatingActionButton(
                            heroTag: "_savebutton",
                            widget: const Text(
                              "Save",
                              style: TextStyle(
                                fontFamily: "outfit",
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              onPressedSave(
                                  context, selectedValue, note, noteController);
                            },
                          ),
                        ),
                        SizedBox(height: Get.size.height * 0.01)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // *** editActionButton save ***
  void onPressedSave(BuildContext context, double selectedValue, String? note,
      TextEditingController noteController) {
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        Get.focusScope?.unfocus();
        Get.back();
      },
    );

    _controller.updateRecord(
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
          title: "Record updated",
          message: DateFormat("d MMMM, y").format(rec.dateTime),
          backgroundColor: Colors.green,
          duration: const Duration(milliseconds: 1500),
          icon: const Icon(Icons.save));
    });
  }

  // *** RECORD DELETE SHOW DIALOG ***
  Future<dynamic> showDeleteConfirmation(Record rec) {
    return DialogService.deleteShowDialog(
      title: "Delete Record",
      content: "Are you sure you want to delete this record ?",
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 200),
          () {
            Get.back(); // dialogu kapat
            _controller.goToHistoryScreen(); // Geçiş yap
            _controller.deleteRecord(rec); // Kayıt silme işlemi
          },
        );
      },
    );
  }

  // *** PHOTO DELETE SHOW DIALOG ***
  Future<dynamic> showDeletePhoto(Record rec) {
    return DialogService.deleteShowDialog(
      title: "Delete Photo",
      content: "Are you sure you want to delete this photo ?",
      onCancel: () {},
      onConfirm: () {
        _controller.removePhoto(rec);
        Get.back();
        _controller.goToHistoryScreen();
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            Get.back();
            SnackbarHelper.showSnackbar(
                title: "Record updated",
                message: DateFormat("d MMMM, y").format(rec.dateTime),
                backgroundColor: Colors.green,
                duration: const Duration(milliseconds: 1500),
                icon: const Icon(Icons.camera_alt));
          },
        );
      },
    );
  }
}
