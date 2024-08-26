import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return DecimalNumberPicker(
      selectedTextStyle: Theme.of(context).textTheme.displaySmall,
      textStyle: Theme.of(context).textTheme.bodySmall,
      itemCount: 3,
      itemWidth: Get.size.width * 0.14,
      itemHeight: Get.size.height * 0.06,
      axis: Axis.horizontal,
      minValue: 40,
      maxValue: 200,
      decimalPlaces: 1,
      value: value,
      onChanged: (value) {
        value = value;
        onChanged(value);
      },
    );
  }
}
