import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetHelper {
  static void showCustomBottomSheet({
    required Widget child,
    required Color color,
  }) {
    Get.bottomSheet(
      isScrollControlled:
          true, // Bu ayar, alt sheet'in yüksekliğini kontrol etmemizi sağlar
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              // Bu kısımda içerik olacak, kaydırılabilir olacak
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight:
                        Get.size.height * 0.7, // Yükseklik sınırlaması burada
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
