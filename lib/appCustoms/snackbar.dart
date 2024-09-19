import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showSnackbar(
      {required String title, // Başlık
      required String message, // Mesaj
      required Color backgroundColor, // Arka plan rengi
      required Duration duration, // Snackbar süresi
      required Icon icon}) {
    Get.snackbar(
        title, // Başlık
        message, // Mesaj
        snackPosition: SnackPosition.TOP, // Snackbar pozisyonu
        backgroundColor:
            backgroundColor.withOpacity(0.5), // Şeffaf arka plan rengi
        borderRadius: 10, // Snackbar köşe yuvarlaklığı
        margin: const EdgeInsets.all(10), // Snackbar dış boşlukları
        duration: duration, // Gösterilme süresi
        icon: icon);
  }
}
