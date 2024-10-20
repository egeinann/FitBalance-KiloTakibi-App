import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:numberpicker/numberpicker.dart';

class Numbers extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  const Numbers({
    super.key,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        const Icon(Ionicons.chevron_back, size: 15),
        DecimalNumberPicker(
          decimalPlaces: 1,
          selectedTextStyle: Theme.of(context).textTheme.displaySmall,
          textStyle: Theme.of(context).textTheme.bodySmall,
          itemCount: 3,
          itemWidth: Get.size.width * 0.14,
          itemHeight: Get.size.height * 0.06,
          axis: Axis.horizontal,
          minValue: 40,
          maxValue: 200,
          value: value,
          onChanged: (newValue) {
            final formattedValue = double.parse(newValue.toStringAsFixed(1));
            onChanged(formattedValue); // Formatlanmış değeri geçirin
          },
        ),
      ],
    );
  }
}

// Container(
//           height: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               width: 3,
//               color: Theme.of(context).primaryColor.withOpacity(0.3),
//             ),
//           ),
//         ),