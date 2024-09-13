import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/record.dart';

class PhotoScreen extends StatelessWidget {
  final Record rec;
  const PhotoScreen({super.key, required this.rec});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingLow,
        child: Center(child: buildPhoto()),
      ),
    );
  }

  Widget buildPhoto() {
    if (rec.photoUrl != null && rec.photoUrl!.isNotEmpty) {
      return (rec.photoUrl!.startsWith('file://'))
          ? const SizedBox()
          : Hero(
              tag: "${rec.photoUrl!}_photo",
              child: Container(
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
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            );
    } else {
      return const Expanded(flex: 4, child: Center(child: Text("No photo !")));
    }
  }
}
