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

  // State yönetimi için GetX ile kullanacağımız değişkenler
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // FocusNode KASMA SORUNU İÇİN

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.focusScope?.unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: context.paddingMedium,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // *** WEIGHT CONTAINER ***
                    weightEntryContainer(context),
                    const Divider(
                      thickness: 2,
                      endIndent: 35,
                      indent: 35,
                    ),
                    // *** DATE CONTAINER ***
                    dateEntryContainer(context),
                    const Divider(
                      thickness: 2,
                      endIndent: 35,
                      indent: 35,
                    ),
                    // *** NOTE CONTAINER ***
                    noteEntryContainer(context),
                    const Divider(
                      thickness: 2,
                      endIndent: 35,
                      indent: 35,
                    ),
                    // *** ADD PHOTO CONTAINER ***
                    addPhotoContainer(context),
                    SizedBox(height: Get.size.height * 0.12),
                  ],
                ),
              ),
              // *** BOTTOM ELEVATED BUTTON ***
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomElevatedButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** FUNCTION FOR ADD BUTTON
  void addPressed(BuildContext context) {
    final double selectedValue = controller.selectedValue.value;
    final DateTime selectedDate = controller.selectedDate.value;
    final String? note =
        _noteController.text.isNotEmpty ? _noteController.text : null;

    if (controller.isRecordExists(selectedDate)) {
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
      weight: selectedValue,
      dateTime: selectedDate,
      note: note,
      photoUrl: controller.photoUrl.value,
    ));

    controller.goToHistoryScreen();

    _noteController.clear();
    controller.photoUrl.value = null; // Fotoğraf URL'sini sıfırla
    Get.focusScope?.unfocus();
  }

  // *** ADD BUTTON ***
  Align bottomElevatedButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomFloatingActionButton(
        heroTag: "onboarding",
        widget: const Icon(Icons.add),
        onPressed: () => Future.delayed(
          const Duration(milliseconds: 200),
          () {
            addPressed(context);
          },
        ),
      ),
    );
  }

  // *** PICK DATE ***
  Future<void> pickDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: ThemeClass.darkTheme, child: child ?? const Text(""));
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        lastDate: DateTime.now().add(const Duration(days: 500)));

    if (selectedDate != null) {
      controller.selectedDate.value = selectedDate;
    }
  }

  // *** ADD NOTE ***
  Widget noteEntryContainer(BuildContext context) {
    return Padding(
      padding: context.paddingLarge,
      child: CustomTextField(
        focusNode: _focusNode,
        controller: _noteController,
        labelText: "note".tr,
        titleIcon: IconButton(
          onPressed: () {
            _noteController.clear(); // TextField'ı sıfırla
          },
          icon: const Icon(Icons.backspace),
        ),
        maxLength: 80,
        onChanged: (value) {
          // Kullanıcının yazdığı notu güncelle
          controller.note.value = value; // Controller'daki notu güncelle
        },
      ),
    );
  }

  // *** ADD DATE ***
  Widget dateEntryContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        pickDate(context);
      },
      child: Padding(
        padding: context.paddingLarge,
        child: Obx(() {
          return Text(
            DateFormat("d MMM, y", Get.locale.toString())
                .format(controller.selectedDate.value),
            style: Theme.of(context).textTheme.bodyLarge,
          );
        }),
      ),
    );
  }

  // *** ADD WEIGHT ***
  Widget weightEntryContainer(BuildContext context) {
    return Padding(
      padding: context.paddingLarge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("YOUR WEIGHT".tr,
                    style: Theme.of(context).textTheme.bodyMedium),
                Obx(() {
                  return Text(
                    "${controller.selectedValue.value} ${"kg".tr}",
                    style: Theme.of(context).textTheme.displaySmall,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Obx(
              () => Numbers(
                value: controller.selectedValue.value,
                onChanged: (value) {
                  controller.selectedValue.value = value;
                },
              ),
            ),
          ), // _selectedvalue
        ],
      ),
    );
  }

  // *** ADD PHOTO ***
  Widget addPhotoContainer(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LottieWidget();
      } else if (controller.photoUrl.value == null) {
        return Padding(
          padding: context.paddingLarge,
          child: FloatingActionButton(
            splashColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).cardColor,
            onPressed: () {
              _pickImage(context);
            },
            child: const Icon(Ionicons.camera),
          ),
        );
      } else {
        return Padding(
          padding: context.paddingLarge,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).canvasColor,
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

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Take a photo'.tr),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Pick from gallery'.tr),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (source != null) {
      controller.isLoading.value = true; // Yükleme başlıyor
      final pickedFile = await picker.pickImage(source: source);

      // Minimum gösterim süresi (örneğin, 1 saniye)
      await Future.delayed(const Duration(milliseconds: 1100));

      if (pickedFile != null) {
        controller.photoUrl.value = pickedFile.path;
      }

      controller.isLoading.value = false; // Yükleme bitiyor
    }
  }
}
