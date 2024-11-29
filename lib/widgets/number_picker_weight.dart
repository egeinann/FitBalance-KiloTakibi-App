import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWeight extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  final RxBool isKgSelected; // KG/LBS seçim durumu

  const NumberPickerWeight({
    super.key,
    required this.value,
    required this.onChanged,
    required this.isKgSelected,
  });

  @override
  Widget build(BuildContext context) {
    // isKgSelected'e göre min ve max değerleri belirle
    final minValue = isKgSelected.value ? 40 : 88;
    final maxValue = isKgSelected.value ? 200 : 440;

    // value'nun geçerli sınırlar içinde olduğundan emin olun
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
            decimalPlaces: 1,
            selectedTextStyle: Get.theme.textTheme.displaySmall,
            textStyle: Get.theme.textTheme.bodySmall,
            itemCount: 3,
            itemWidth: Get.size.width * 0.14,
            itemHeight: Get.size.height * 0.06,
            axis: Axis.horizontal,
            minValue: minValue,
            maxValue: maxValue,
            value:
                adjustedValue, // value'nun sınırlandırılmış versiyonunu kullanın
            onChanged: (newValue) {
              final formattedValue = double.parse(newValue.toStringAsFixed(1));
              onChanged(formattedValue); // Formatlanmış değeri geçirin
            },
          ),
          const Icon(AppIcons.chevronBack, size: 15),
        ],
      ),
    );
  }
}
