import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerHeight extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final RxBool isCmSelected; // CM/FT seçim durumu

  const NumberPickerHeight({
    super.key,
    required this.value,
    required this.onChanged,
    required this.isCmSelected,
  });

  @override
  Widget build(BuildContext context) {
    // isCmSelected'e göre min ve max değerlerini belirle
    final double minValue =
        isCmSelected.value ? 100.0 : 3.0; // 100 cm veya 3 ft
    final double maxValue =
        isCmSelected.value ? 250.0 : 8.0; // 250 cm veya 8 ft

    // Değerin geçerli sınırlar içinde olduğundan emin ol
    final adjustedValue = value.clamp(minValue, maxValue).toDouble();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          DecimalNumberPicker(
            decimalPlaces: isCmSelected.value
                ? 0
                : 1, // cm için ondalık yok, ft için 1 ondalık
            selectedTextStyle: Get.theme.textTheme.displaySmall,
            textStyle: Get.theme.textTheme.bodySmall,
            itemCount: 3,
            itemWidth: Get.size.width * 0.14,
            itemHeight: Get.size.height * 0.06,
            axis: Axis.horizontal,
            minValue:
                minValue.toInt(), // Integer olması gerektiği durumlarda dönüşüm
            maxValue:
                maxValue.toInt(), // Integer olması gerektiği durumlarda dönüşüm
            value: isCmSelected.value
                ? adjustedValue
                    .toInt()
                    .toDouble() // cm modunda tam sayı, double'a dönüştürülmüş
                : adjustedValue, // ft modunda double değer
            onChanged: (newValue) {
              final formattedValue = double.parse(newValue.toStringAsFixed(1));
              onChanged(formattedValue); // Formatlanmış değeri geçir
            },
          ),
          const Icon(Ionicons.chevron_back, size: 15),
        ],
      ),
    );
  }
}
