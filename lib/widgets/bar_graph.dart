import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';

final Controller controller = Get.find();
Obx barGraph() {
  return Obx(() {
    final monthlyData = controller.calculateMonthlyAverages();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          // *** BAR CHART ***
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("Averages of the last 1 year".tr,
                style: Get.theme.textTheme.bodyMedium),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: _getMonthlyAverageBarGroups(),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 11,
                            color: Get.theme.indicatorColor,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: Get.size.height * 0.05,
                      getTitlesWidget: (value, meta) {
                        final monthIndex = value.toInt();
                        final monthYear = monthlyData.keys.firstWhere(
                          (key) =>
                              DateTime(int.parse(key.split('-')[0]),
                                      int.parse(key.split('-')[1]))
                                  .month ==
                              monthIndex,
                        );
                        final year = int.parse(monthYear.split('-')[0]);
                        final month = DateFormat('MMM', Get.locale.toString())
                            .format(DateTime(year, monthIndex));
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            month,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
                ),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.3),
                    strokeWidth: 1,
                  ),
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                    getTooltipColor: (group) => Get.theme
                        .primaryColor,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        "${rod.toY} ${'kg'.tr}", // Tooltip'te gösterilecek ağırlık değeri
                        const TextStyle(
                          color: Colors.white, // Tooltip metin rengi
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

List<BarChartGroupData> _getMonthlyAverageBarGroups() {
  final monthlyData = controller.calculateMonthlyAverages();
  final List<List<Color>> barGradients = [
    [Colors.red, Colors.redAccent],
    [Colors.blue, Colors.lightBlueAccent],
    [Colors.green, Colors.lightGreenAccent],
    [Colors.yellow, Colors.yellowAccent],
    [Colors.orange, Colors.deepOrangeAccent],
    [Colors.brown, Colors.brown.shade300],
    [Colors.cyan, Colors.cyanAccent],
    [Colors.purple, Colors.deepPurpleAccent],
    [Colors.indigo, Colors.indigoAccent],
    [Colors.teal, Colors.tealAccent],
    [Colors.lime, Colors.limeAccent],
    [Colors.pink, Colors.pinkAccent]
  ];
  /*
  Colors.pink, Colors.pinkAccent
  Colors.indigo, Colors.indigoAccent
  */
  // Son 12 ayı almak için verileri tersine çevir ve son 12 öğeyi al
  final recentMonthlyData =
      monthlyData.entries.toList().reversed.take(12).toList().reversed.toList();

  return recentMonthlyData.map((entry) {
    final monthYear = entry.key.split('-');
    final month = int.parse(monthYear[1]);
    final averageWeight = double.parse(entry.value.toStringAsFixed(
        2)); // Ondalık kısmı 2 basamağa indirgenmiş double değer
    final gradientIndex = (month - 1) %
        barGradients.length; // Ayın dizinini gradyan dizinine eşleyin
    final barGradient = barGradients[gradientIndex]; // Ay için gradyan seçin

    return BarChartGroupData(
      x: month,
      barRods: [
        BarChartRodData(
          toY: averageWeight,
          width: 10,
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            colors: barGradient,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: averageWeight + 20,
            color: barGradient[0].withOpacity(0.0),
          ),
        ),
      ],
    );
  }).toList();
}
