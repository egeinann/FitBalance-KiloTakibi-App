import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: customLeading(context),
              trailing: customTrailing(context),
            ),
          ),
        ),
        if (rec.note != null && rec.note!.isNotEmpty)
          Positioned(
            top: 1,
            right: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 8,
                ),
                Text(
                  "note".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
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
                  backgroundImage: FileImage(File(rec.photoUrl!)), radius: 14),
        const SizedBox(width: 5),
        Text(
          DateFormat("d MMM, yy", Get.locale.toString()).format(rec.dateTime),
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
            "${rec.weight} ${"kg".tr}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Ionicons.chevron_forward),
      ],
    );
  }
}
