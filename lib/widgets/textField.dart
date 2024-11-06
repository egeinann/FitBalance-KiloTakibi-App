import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;
  final int maxLength; // maxLength zorunlu hale getirildi
  final Widget? titleIcon;
  final FocusNode? focusNode; // zorunlu değil

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.titleIcon,
    required this.maxLength, // Zorunlu parametre
    this.focusNode, // Parametreyi ekleyin
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
      decoration: InputDecoration(
        counterText: "",
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade700,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade700,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Get.theme.scaffoldBackgroundColor,
        prefixIcon: titleIcon,
      ),
      cursorColor: Get.theme.focusColor,
      style: Get.theme.textTheme.titleLarge,
      onChanged: (value) {
        onChanged(value);
      },
      onSubmitted: (value) {
        Get.focusScope; // Klavyeyi kapatma
      },
    );
  }
}
