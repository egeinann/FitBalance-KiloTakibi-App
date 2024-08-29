import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';

final Controller _controller = Get.find();
Obx barGraph(BuildContext context) {
  return Obx(() {
    final monthlyData = _controller.calculateMonthlyAverages();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // *** BAR CHART ***
          Text("Averages of the last 1 year",style: Theme.of(context).textTheme.bodyMedium),
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
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(),style: Theme.of(context).textTheme.bodySmall);
                      },
                      reservedSize: Get.size.width * 0.08,
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
                      reservedSize: Get.size.height * 0.07,
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
                        final month = DateFormat('MMM\n yy')
                            .format(DateTime(year, monthIndex));
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(month,
                              style: Theme.of(context).textTheme.bodySmall),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: Theme.of(context).cardColor, width: 0.5),
                ),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Theme.of(context).cardColor.withOpacity(0.3),
                    strokeWidth: 1,
                  ),
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                    getTooltipColor: (group) => Theme.of(context)
                        .primaryColor, // Tooltip arka plan rengini burada belirleyin
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem("${rod.toY} kg", // Tooltip'te gösterilecek ağırlık değeri
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
  final monthlyData = _controller.calculateMonthlyAverages();
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
