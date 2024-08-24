import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class GalleryScreen extends StatelessWidget {
  final List<Record> records; // Fotoğrafları ve tarihleri göstermek için

  const GalleryScreen({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    // Filtrelenmiş kayıtları al (fotoğrafı olanları)
    final photoRecords = records
        .where(
            (record) => record.photoUrl != null && record.photoUrl!.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Gallery", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingMedium,
        child: photoRecords.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image: AssetImage(
                            "assets/images/homeScreen/null_gallery.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "You don't have any photos yet !",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: context.paddingLow,
                itemCount: photoRecords.length,
                itemBuilder: (context, index) {
                  final record = photoRecords[index];
                  return GridTile(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.size.height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: record.photoUrl!.startsWith('file://')
                                ? const SizedBox()
                                : Image.file(File(record.photoUrl!),
                                    fit: BoxFit.cover),
                          ),
                          SizedBox(height: Get.size.height * 0.005),
                          Text(
                            DateFormat("d MMM, y").format(record.dateTime),
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
