import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class RecordListTile extends StatelessWidget {
  final Record rec;

  const RecordListTile({super.key, required this.rec});

  @override
  Widget build(BuildContext context) {
    Get.focusScope?.unfocus();
    return Stack(
      children: [
        Container(
          height: 60,
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
                  const EdgeInsets.symmetric(horizontal: 10),
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
        Hero(
          tag:
              "${rec.weight}_${rec.dateTime.toIso8601String()}_weight", // Tarih ve kilo kombinasyonu
          child: Text(
            "${rec.weight} kg",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        SizedBox(width: Get.size.width * 0.05),
        const Icon(Ionicons.chevron_forward),
      ],
    );
  }
}
