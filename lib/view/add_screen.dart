import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/lottie_loading.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/appCustoms/themes.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  double _selectedValue = 40.0; // Başlangıç değerini 40 olarak ayarlayın
  DateTime _selectedDate = DateTime.now();
  String? _note;
  final Controller _controller = Get.find();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animateDecimalNumberPicker(); // Animasyonu başlat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // FocusScope.of(context).unfocus();
          // Sadece TextField odakta olduğunda klavyeyi kapat
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
                    weightEntryContainer(),
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
                    noteEntryContainer(),
                    const Divider(
                      thickness: 2,
                      endIndent: 35,
                      indent: 35,
                    ),
                    // *** ADD PHOTO CONTAINER ***
                    addPhotoContainer(),
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

  // *** DECIMAL OPENNING ANIMATION ***
  void _animateDecimalNumberPicker() {
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        if (_selectedValue < 70) {
          _selectedValue += 5; // Her adımda 5 artır
          if (_selectedValue > 70) {
            _selectedValue = 70; // 70'ten büyük olmasın
          }
        } else {
          timer.cancel(); // 70'e ulaştığında timer'ı durdur
        }
      });
    });
  }

  // *** FUNCTION FOR ADD BUTTON
  void addPressed() {
    if (_controller.isRecordExists(_selectedDate)) {
      SnackbarHelper.showSnackbar(
        title: "There is already a record for the same date".tr,
        message: "Change the date".tr,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1100),
        icon: const Icon(Ionicons.calendar_outline),
      );
      return;
    }

    _controller.addRecord(Record(
      weight: _selectedValue,
      dateTime: _selectedDate,
      note: _note,
      photoUrl: _controller.photoUrl.value,
    ));

    _controller.goToHistoryScreen();

    _noteController.clear();
    _note = null;
    _controller.photoUrl.value = null; // Fotoğraf URL'sini sıfırla
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
            addPressed();
          },
        ),
      ),
    );
  }

  // *** PICK DATE ***
  Future<void> pickDate(BuildContext context) async {
    _selectedDate = await showDatePicker(
            builder: (context, child) {
              return Theme(
                  data: ThemeClass.darkTheme, child: child ?? const Text(""));
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 0)),
            lastDate: DateTime.now().add(const Duration(days: 500))) ??
        _selectedDate;
    setState(() {});
  }

  // *** ADD NOTE ***
  Widget noteEntryContainer() {
    return Padding(
      padding: context.paddingLarge,
      child: CustomTextField(
        controller: _noteController,
        labelText: "note".tr,
        onChanged: (value) {
          _note = value;
        },
        titleIcon: IconButton(
          onPressed: () {
            _noteController.clear(); // TextField'ı sıfırla
            _note = "";
          },
          icon: const Icon(Icons.backspace),
        ),
        maxLength: 80,
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
        child: Text(
          DateFormat("d MMM, y", Get.locale.toString()).format(_selectedDate),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  // *** ADD WEIGHT ***
  Widget weightEntryContainer() {
    return Padding(
      padding: context.paddingLarge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("YOUR WEIGHT".tr,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(
                "$_selectedValue ${"kg".tr}",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Numbers(
                value: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              const Icon(
                Ionicons.chevron_back,
                size: 12,
              ),
            ],
          ), // _selectedvalue
        ],
      ),
    );
  }

  // *** ADD PHOTO ***
  Widget addPhotoContainer() {
    return Obx(() {
      if (_controller.isLoading.value) {
        // Yükleme sırasında Lottie animasyonu göster
        return const LottieWidget();
      } else if (_controller.photoUrl.value == null) {
        return Padding(
          padding: context.paddingLarge,
          child: FloatingActionButton(
            splashColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).cardColor,
            onPressed: () {
              _pickImage();
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
                  File(_controller.photoUrl.value!),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Ionicons.close, color: Colors.red, size: 40),
                  onPressed: () {
                    _controller.photoUrl.value = null; // Fotoğrafı kaldır
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  Future<void> _pickImage() async {
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
      _controller.isLoading.value = true; // Yükleme başlıyor
      final pickedFile = await picker.pickImage(source: source);

      // Minimum gösterim süresi (örneğin, 1 saniye)
      await Future.delayed(const Duration(milliseconds: 1100));

      if (pickedFile != null) {
        _controller.photoUrl.value = pickedFile.path;
      }

      _controller.isLoading.value = false; // Yükleme tamamlandı
    }
  }
}
