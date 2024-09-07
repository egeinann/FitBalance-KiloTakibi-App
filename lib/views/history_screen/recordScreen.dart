import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';
import 'package:kilo_takibi_uyg/views/home_screen.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';

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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage(),
                  buildWeight(context),
                  buildNote(context),
                  buildPhoto(),
                ],
              ),
              FloatingActionButton(
                heroTag: "x",
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                splashColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 10,
                onPressed: () {
                  _showEditModalBottomSheet(context);
                },
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildImage() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(left: Get.size.width * 0.06),
        child: const Image(
          image: AssetImage("assets/images/homeScreen/recordScreen.png"),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Padding buildWeight(BuildContext context) {
    return Padding(
      padding: context.paddingLarge,
      child: Text("${rec.weight} kg",
          style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Column buildNote(BuildContext context) {
    return Column(
      children: [
        if (rec.note != null && rec.note!.isNotEmpty)
          Container(
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
          )
        else
          Text("No notes !", style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }

  Widget buildPhoto() {
    if (rec.photoUrl != null && rec.photoUrl!.isNotEmpty) {
      return Expanded(
        flex: 4,
        child: (rec.photoUrl!.startsWith('file://'))
            ? const SizedBox()
            : Stack(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(23)),
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
                        _controller.removePhoto(rec);
                        Get.to(
                          HomeScreen(),
                          transition:
                              Transition.leftToRight, // Geçiş animasyonu
                        );
                      },
                    ),
                  ),
                ],
              ),
      );
    } else {
      return const Expanded(flex: 4, child: Center(child: Text("No photo !")));
    }
  }

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
                        Numbers(
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                        SizedBox(height: Get.size.height * 0.02),
                        TextField(
                          controller: noteController,
                          onChanged: (value) {
                            note = value;
                          },
                          maxLength: 120,
                          decoration: InputDecoration(
                            hintText: "Enter a note",
                            filled: true,
                            fillColor: Theme.of(context).canvasColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 18),
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
                              borderSide: BorderSide(
                                color: Theme.of(context).canvasColor,
                                width: 2,
                              ),
                            ),
                            counterText: "",
                          ),
                        ),
                        SizedBox(height: Get.size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            heroTag: "x",
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            splashColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            elevation: 10,
                            onPressed: () {
                              onPressedSave(
                                  context, selectedValue, note, noteController);
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                fontFamily: "outfit",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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

  // *** onpressed for save ***
  void onPressedSave(BuildContext context, double selectedValue, String? note,
      TextEditingController noteController) {
    Get.focusScope?.unfocus();
    Navigator.pop(context);
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
    Future.delayed(const Duration(milliseconds: 400), () {
      Get.to(
        HomeScreen(),
        transition: Transition.leftToRight, // Geçiş animasyonu
      );
    });
  }
}
