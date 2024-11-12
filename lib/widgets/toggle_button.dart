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
      splashColor: Get.theme.scaffoldBackgroundColor,
      fillColor: Get.theme.focusColor,
      color: const Color.fromARGB(
          255, 146, 146, 146), // Seçili olmayan butonların metin rengi
      selectedBorderColor: Colors.orange, // Seçili butonun sınır rengi
      selectedColor: Colors.white, // Seçili butonun arka plan rengi
      borderRadius: BorderRadius.circular(10),
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    ),
  );
}
