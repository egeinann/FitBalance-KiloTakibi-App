import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customToggleButton({
  required List<bool> isSelected,
  required void Function(int) onPressed,
  required List<Widget> children,
}) {
  return SizedBox(
    height: 45,
    child: ToggleButtons(
      borderWidth: 0,
      splashColor: Get.theme.focusColor,
      fillColor: Colors.transparent, // Arka plan rengini transparan yapıyoruz
      color: Colors.grey.withOpacity(0.6), // seçili olmayan metin rengi
      selectedColor: Colors.white, // Seçili metin rengi
      borderRadius: BorderRadius.circular(10),
      isSelected: isSelected,
      onPressed: (index) {
        // Buton animasyonunu değiştirmek için state yönetimi
        for (int i = 0; i < isSelected.length; i++) {
          isSelected[i] = i == index; // Yalnızca seçilen true olacak
        }
        onPressed(index); // Kullanıcı callback'i
      },
      children: children.map((child) {
        final index = children.indexOf(child);
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 50,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isSelected[index]
                  ? Get.theme.focusColor
                  : Colors.transparent, // Seçili buton rengi
              borderRadius: BorderRadius.circular(5),
              boxShadow: isSelected[index]
                  ? [
                      BoxShadow(
                        color: Get.theme.focusColor.withOpacity(0.8),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [],
              border: Border.all(
                color: isSelected[index]
                    ? Get.theme.focusColor
                    : Colors.grey.withOpacity(0.6),
                width: 3,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: child,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
