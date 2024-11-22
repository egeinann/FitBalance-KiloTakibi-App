import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record_model/record.dart';

class GalleryScreen extends GetView<Controller> {
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
      body: Padding(
        padding: context.paddingLow,
        child: photoRecords.isEmpty
            ? noPhotoWidget(context)
            : buildPhotos(context, photoRecords),
      ),
    );
  }

  // *** BUILD PHOTOS ***
  GridView buildPhotos(BuildContext context, List<Record> photoRecords) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photoRecords.length,
      itemBuilder: (context, index) {
        final rec = photoRecords[index];
        return GridTile(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: rec.photoUrl!.startsWith('file://')
                                ? const SizedBox()
                                : GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.photoscreen,
                                          arguments: rec);
                                    },
                                    child: Hero(
                                      tag: "${rec.photoUrl!}_photo",
                                      child: Container(
                                        width: Get.size.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          child: Image(
                                            image: FileImage(
                                              File(rec.photoUrl!),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            DateFormat("d MMMM, y", Get.locale.toString())
                                .format(rec.dateTime),
                            style: Get.theme.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  customFloatingActionButton(
                    mini: true,
                    heroTag: "${rec.photoUrl}_goRecordScreenButton",
                    widget: const Icon(Ionicons.arrow_forward),
                    onPressed: () {
                      Future.delayed(
                        const Duration(milliseconds: 150),
                        () {
                          Get.toNamed(Routes.recordscreen, arguments: rec);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // *** NO PHOTO ***
  Center noPhotoWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.size.height * 0.05),
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/mainScreen/null_gallery.png"),
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
                  "You don't have any photos yet !".tr,
                  style: Get.theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
