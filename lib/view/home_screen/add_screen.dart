import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/divider.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/lottie_loading.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/config/themes.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_weight.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class AddScreen extends GetView<Controller> {
  AddScreen({super.key});
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final SettingsController _settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
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
                    const CustomDivider(),
                    dateEntryContainer(),
                    const CustomDivider(),
                    noteEntryContainer(),
                    const CustomDivider(),
                    addPhotoContainer(),
                    SizedBox(height: Get.size.height * 0.12),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
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
      weight: controller.currentWeight.value,
      dateTime: controller.selectedDate.value,
      note: note,
      photoUrl: controller.photoUrl.value,
    ));

    controller.goToHistoryScreen();
    _noteController.clear();
    controller.photoUrl.value = null; // Fotoğraf URL'sini sıfırla
    Get.focusScope?.unfocus();
    Get.back();
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.toNamed(Routes.animationbackgroundscreen);
    });
  }

  // *** ADD BUTTON ***
  Widget bottomAddButton() {
    return customFloatingActionButton(
      widget: const Icon(Icons.add),
      onPressed: addPressed, // Doğrudan fonksiyonu çağır
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
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("YOUR WEIGHT".tr, style: Get.theme.textTheme.bodyMedium),
                  Obx(
                    () {
                      return Text(
                        "${controller.currentWeight.value} ${_settingsController.weightUnit}",
                        style: Get.theme.textTheme.displaySmall,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => NumberPickerWeight(
                isKgSelected: _settingsController.isKgSelected,
                value: controller.currentWeight.value,
                onChanged: (value) {
                  controller.currentWeight.value = value;
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
          child: customFloatingActionButtonYellow(
            onPressed: () => _pickImage(), // Doğrudan fonksiyonu çağır
            widget: const Icon(Ionicons.camera),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(controller.photoUrl.value!),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Ionicons.close, color: Colors.white),
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
    final source = await Get.bottomSheet<ImageSource>(
      Container(
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
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
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
