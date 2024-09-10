import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class RecordListTile extends StatelessWidget {
  final Record rec;
  final Controller _controller = Get.find();

  RecordListTile({super.key, required this.rec});

  @override
  Widget build(BuildContext context) {
    Get.focusScope?.unfocus();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).canvasColor.withOpacity(0.1),
                Theme.of(context).cardColor.withOpacity(0.9),
              ],
            ),
          ),
          child: Center(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              leading: customLeading(context),
              trailing: customTrailing(context),
            ),
          ),
        ),
        if (rec.note != null && rec.note!.isNotEmpty)
          const Positioned(
            top: 1,
            right: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 8,
                ),
                Text(
                  "note",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "outift",
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }

  // *** LEDAING ***
  Widget customLeading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (rec.photoUrl != null && rec.photoUrl!.isNotEmpty)
          (rec.photoUrl!.startsWith('file://'))
              ? const SizedBox()
              : CircleAvatar(
                  backgroundImage: FileImage(File(rec.photoUrl!)), radius: 15),
        SizedBox(width: Get.size.width * 0.01),
        Text(
          DateFormat("d MMM, yy").format(rec.dateTime),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  // *** TRAILING ***
  Widget customTrailing(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${rec.weight} kg",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(width: Get.size.width * 0.05),
        const Icon(Ionicons.chevron_forward),
      ],
    );
  }

  // *** DELETE SHOW DIALOG ***
  Future<dynamic> _deleteShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Delete Record",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            "Are you sure you want to delete this record?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                _controller.deleteRecord(rec);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // *** EDIT SHOW DIALOG ***
  /*
  void _showEditModalBottomSheet(BuildContext context, Record record) {
    double selectedValue = record.weight;
    String? note = record.note;
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
                        appButton(
                          () {
                            _controller.updateRecord(
                              record,
                              Record(
                                weight: selectedValue,
                                note: note,
                                dateTime: record.dateTime,
                                photoUrl: record
                                    .photoUrl, // Fotoğraf URL'sini koruyun
                              ),
                            );
                            Navigator.pop(
                                context); // Kullanıcıyı geri döndürmek için
                            noteController.clear();
                            Get.focusScope?.unfocus();
                          },
                          const Text(
                            "Save",
                            style: TextStyle(fontFamily: "outfit"),
                          ),
                        )
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
  */
}
