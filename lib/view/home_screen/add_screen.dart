import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/lottie_loading.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/config/themes.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class AddScreen extends GetView<Controller> {
  AddScreen({super.key});
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => Get.focusScope?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: context.paddingMedium,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    weightEntryContainer(),
                    const Divider(thickness: 2, endIndent: 35, indent: 35),
                    dateEntryContainer(),
                    const Divider(thickness: 2, endIndent: 35, indent: 35),
                    noteEntryContainer(),
                    const Divider(thickness: 2, endIndent: 35, indent: 35),
                    addPhotoContainer(),
                    SizedBox(height: Get.size.height * 0.12),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomAddButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** ADD BUTTON PRESSED ***
  void addPressed() {
    final String? note =
        _noteController.text.isNotEmpty ? _noteController.text : null;

    if (controller.isRecordExists(controller.selectedDate.value)) {
      SnackbarHelper.showSnackbar(
        title: "There is already a record for the same date".tr,
        message: "Change the date".tr,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1100),
        icon: const Icon(Ionicons.calendar_outline),
      );
      return;
    }

    controller.addRecord(Record(
      weight: controller.selectedValue.value,
      dateTime: controller.selectedDate.value,
      note: note,
      photoUrl: controller.photoUrl.value,
    ));

    controller.goToHistoryScreen();

    _noteController.clear();
    controller.photoUrl.value = null; // Fotoğraf URL'sini sıfırla
    Get.focusScope?.unfocus();
    Get.back();
  }

  // *** ADD BUTTON ***
  Align bottomAddButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomFloatingActionButton(
        widget: const Icon(Icons.add),
        onPressed: addPressed, // Doğrudan fonksiyonu çağır
      ),
    );
  }

  // *** SELECT DATE ***
  Future<void> pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeClass.darkTheme,
          child: child ?? const SizedBox(),
        );
      },
      context: Get.context!, // Use Get.context here
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime.now().add(const Duration(days: 500)),
    );

    if (selectedDate != null) {
      controller.selectedDate.value = selectedDate;
    }
  }

  // *** ENTRY NOTE ***
  Widget noteEntryContainer() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomTextField(
        focusNode: _focusNode,
        controller: _noteController,
        labelText: "note".tr,
        titleIcon: IconButton(
          onPressed: () => _noteController.clear(),
          icon: const Icon(Icons.backspace),
        ),
        maxLength: 80,
        onChanged: (value) {
          controller.note.value = value; // Controller'daki notu güncelle
        },
      ),
    );
  }

  // *** ENTRY DATE ***
  Widget dateEntryContainer() {
    return GestureDetector(
      onTap: pickDate, // Fonksiyonu doğrudan çağır
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          return Text(
            DateFormat("d MMM, y", Get.locale.toString())
                .format(controller.selectedDate.value),
            style: Get.theme.textTheme.bodyLarge,
          );
        }),
      ),
    );
  }

  // *** ENTRY WEIGHT ***
  Widget weightEntryContainer() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("YOUR WEIGHT".tr, style: Get.theme.textTheme.bodyMedium),
                Obx(() {
                  return Text(
                    "${controller.selectedValue.value} ${"kg".tr}",
                    style: Get.theme.textTheme.displaySmall,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => Numbers(
                value: controller.selectedValue.value,
                onChanged: (value) {
                  controller.selectedValue.value = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // *** ENTRY PHOTO ***
  Widget addPhotoContainer() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LottieWidget();
      } else if (controller.photoUrl.value == null) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: CustomFloatingActionButton(
            onPressed: () => _pickImage(), // Doğrudan fonksiyonu çağır
            widget: const Icon(Ionicons.camera),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.canvasColor,
                ),
                child: Image.file(
                  File(controller.photoUrl.value!),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Ionicons.close, color: Colors.red, size: 40),
                  onPressed: () {
                    controller.photoUrl.value = null; // Fotoğrafı kaldır
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  // *** SELECT PHOTO ***
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: Get.context!,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Take a photo'.tr),
              onTap: () => Get.back(result: ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Pick from gallery'.tr),
              onTap: () => Get.back(result: ImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (source != null) {
      controller.isLoading.value = true; // Yükleme başlıyor
      final pickedFile = await picker.pickImage(source: source);

      await Future.delayed(
          const Duration(milliseconds: 1100)); // Minimum gösterim süresi

      if (pickedFile != null) {
        controller.photoUrl.value = pickedFile.path;
      }

      controller.isLoading.value = false; // Yükleme bitiyor
    }
  }
}
