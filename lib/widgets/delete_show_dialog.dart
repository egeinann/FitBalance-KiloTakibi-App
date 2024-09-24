import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class DialogService {
  // Kayıt silme onayı için dialog gösterme fonksiyonu
  static Future<dynamic> deleteShowDialog({
    required String title,
    required String content,
    required VoidCallback onCancel,
    required VoidCallback onConfirm,
  }) {
    return Get.dialog(
      _BlurDialog(
        title: title,
        content: content,
        onCancel: onCancel,
        onConfirm: onConfirm,
      ),
      barrierDismissible: false, // Dialog dışına tıklanarak kapanmasın
    );
  }
}

class _BlurDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const _BlurDialog({
    required this.title,
    required this.content,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  __BlurDialogState createState() => __BlurDialogState();
}

class __BlurDialogState extends State<_BlurDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Animasyon süresi
    )..forward(); // Animasyonu başlat

    _animation = Tween<double>(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Animasyon eğrisi
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Controller'ı temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: _animation.value, sigmaY: _animation.value),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Arka plan rengi
              ),
            ),
            AlertDialog(
              title: Text(
                widget.title,
                style: Get.textTheme.bodyLarge,
              ),
              content: Text(
                widget.content,
                style: Get.textTheme.bodyMedium,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: Get.textTheme.labelSmall,
                  ),
                  onPressed: () {
                    widget
                        .onCancel(); // İptal işlemine yönelik fonksiyonu çağır
                    Get.back(); // Dialog'u kapat
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
                    widget
                        .onConfirm(); // Onay işlemine yönelik fonksiyonu çağır
                    Get.back(); // Dialog'u kapat
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
