import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/appCustoms/themes.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';
import 'package:kilo_takibi_uyg/widgets/elevated_button.dart';
import 'package:image_picker/image_picker.dart';

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
          FocusScope.of(context).unfocus();
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
                    SizedBox(height: Get.size.height * 0.02),
                    // *** DATE CONTAINER ***
                    dateEntryContainer(context),
                    SizedBox(height: Get.size.height * 0.02),
                    // *** NOTE CONTAINER ***
                    noteEntryContainer(),
                    SizedBox(height: Get.size.height * 0.02),
                    // *** ADD PHOTO CONTAINER ***
                    addPhotoContainer(),
                    SizedBox(height: Get.size.height * 0.15),
                  ],
                ),
              ),
              // *** BOTTOM ELEVATED BUTTON ***
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomElevatedButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** DECIMAL OPENNING ANIMATION ***
  void _animateDecimalNumberPicker() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
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
      Get.snackbar(
        duration: const Duration(seconds: 1),
        "There is already a record for the same date.",
        "",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(48, 255, 0, 0),
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
      child: appButton(
        () => addPressed(),
        const Icon(Icons.add),
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
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 500))) ??
        _selectedDate;
    setState(() {});
  }

  // *** ADD NOTE ***
  Widget noteEntryContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: context.paddingLarge,
        child: TextField(
          controller: _noteController,
          maxLength: 60,
          decoration: InputDecoration(
            hintText: "Enter a note",
            filled: true,
            fillColor: Theme.of(context).canvasColor,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              borderSide:
                  BorderSide(color: Theme.of(context).canvasColor, width: 2),
            ),
            counterText: "",
          ),
          onChanged: (value) {
            _note = value;
          },
        ),
      ),
    );
  }

  // *** ADD DATE ***
  Widget dateEntryContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          pickDate(context);
        },
        child: Padding(
          padding: context.paddingLarge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Text("SELECTED DATE",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Text(
                DateFormat("d MMM, y").format(_selectedDate),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** ADD WEIGHT ***
  Widget weightEntryContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: context.paddingLarge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Theme.of(context).canvasColor),
                  child: Text("YOUR WEIGHT",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                Text("$_selectedValue kg",
                    style: Theme.of(context).textTheme.displaySmall),
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
                  Icons.arrow_left_rounded,
                  size: 20,
                ),
              ],
            ), // _selectedvalue
          ],
        ),
      ),
    );
  }

  // *** ADD PHOTO ***
  Widget addPhotoContainer() {
    return Obx(() {
      return _controller.photoUrl.value == null
          ? Stack(
              children: [
                FloatingActionButton(
                  heroTag: "d",
                  splashColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                  onPressed: () {
                    _pickImage();
                  },
                  child: const Icon(Ionicons.camera),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).canvasColor,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            )
          : Padding(
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
                      icon: const Icon(Ionicons.close,
                          color: Colors.red, size: 40),
                      onPressed: () {
                        _controller.photoUrl.value = null; // Fotoğrafı kaldır
                      },
                    ),
                  ),
                ],
              ),
            );
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
              title: const Text('Take a photo'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick from gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _controller.photoUrl.value = pickedFile.path;
        });
      }
    }
  }
}
