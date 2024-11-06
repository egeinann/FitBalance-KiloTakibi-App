import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

final Controller controller = Get.find();
Obx lineGraph() {
  return Obx(
    () {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            // *** TEXTS TIME RANGE ***
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                controller.selecedAllTimeGraph.value
                    ? "All records".tr
                    : "Records of the last 30 days".tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
            ),
            // *** LINE CHART EXPANDED ***
            Expanded(
              flex: 14,
              child: AnimatedSwitcher(
                // 1. AnimatedSwitcher eklendi
                duration:
                    const Duration(milliseconds: 200), // 2. Animasyon süresi
                child: LineChart(
                  key: ValueKey<bool>(controller
                      .selecedAllTimeGraph.value), // 3. ValueKey eklendi
                  curve: Curves.linearToEaseOut,
                  duration: const Duration(milliseconds: 200),
                  LineChartData(
                    lineTouchData: LineTouchData(
                      handleBuiltInTouches: true,
                      touchTooltipData: LineTouchTooltipData(
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        tooltipRoundedRadius: 8,
                        tooltipPadding: const EdgeInsets.all(8),
                        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                          return touchedBarSpots.map((barSpot) {
                            final record =
                                controller.filteredRecords.firstWhere(
                              (record) =>
                                  record.dateTime.millisecondsSinceEpoch
                                      .toDouble() ==
                                  barSpot.x,
                            );
                            return LineTooltipItem(
                              '${DateFormat('d MMM, y', Get.locale.toString()).format(record.dateTime)}\n${record.weight} ${"kg".tr}',
                              const TextStyle(color: Colors.white),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 10,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 0.5,
                      ),
                      getDrawingVerticalLine: (value) => const FlLine(
                        color: Colors.transparent,
                        strokeWidth: 0,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 10,
                          reservedSize: Get.size.width * 0.07,
                          getTitlesWidget: (value, meta) => Text(
                              value.toInt().toString(),
                              style: Get.theme.textTheme.bodySmall),
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: Get.size.height * 0.07,
                          getTitlesWidget: (value, meta) {
                            final date = DateTime.fromMillisecondsSinceEpoch(
                                value.toInt());

                            // İlk, son ve ortada birkaç tarih göstermek için bir koşul ekleyelim
                            int totalRecords =
                                controller.filteredRecords.length;
                            int interval = (totalRecords / 5)
                                .ceil(); // Yaklaşık 5 tarih göstermek için aralığı hesaplayalım
                            int index = controller.filteredRecords.indexWhere(
                                (record) =>
                                    record.dateTime.millisecondsSinceEpoch ==
                                    value.toInt());

                            // İlk, son ve belirli aralıklarla tarihleri göster
                            if (index == 0 ||
                                index == totalRecords - 1 ||
                                index % interval == 0) {
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        DateFormat(
                                                'd MMM', Get.locale.toString())
                                            .format(date),
                                        style: Get.theme
                                            .textTheme
                                            .bodySmall),
                                    Text(DateFormat('y').format(date),
                                        style: Get.theme
                                            .textTheme
                                            .bodySmall)
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox
                                  .shrink(); // Diğer durumlarda boş widget döndür
                            }
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey, width: 0.1),
                    ),
                    minX: controller.filteredRecords.isNotEmpty
                        ? controller.filteredRecords.first.dateTime
                            .millisecondsSinceEpoch
                            .toDouble()
                        : 0,
                    maxX: controller.filteredRecords.isNotEmpty
                        ? controller.filteredRecords.last.dateTime
                            .millisecondsSinceEpoch
                            .toDouble()
                        : 0,
                    minY: controller.records.isNotEmpty
                        ? controller.records
                                .map((record) => record.weight)
                                .reduce((a, b) => a < b ? a : b) -
                            10
                        : 0, // Liste boşken kullanılacak varsayılan değer
                    maxY: controller.filteredRecords.isNotEmpty
                        ? controller.filteredRecords
                                .map((r) => r.weight)
                                .reduce((a, b) => a > b ? a : b) +
                            10
                        : 60,
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.filteredRecords
                            .map(
                              (record) => FlSpot(
                                  record.dateTime.millisecondsSinceEpoch
                                      .toDouble(),
                                  record.weight),
                            )
                            .toList(),
                        isCurved: false,
                        gradient: LinearGradient(
                          colors: [
                            Get.theme.primaryColor.withOpacity(0.5),
                            Get.theme.primaryColor.withOpacity(1)
                          ],
                        ),
                        preventCurveOverShooting: true,
                        isStepLineChart: false,
                        color: Get.theme.cardColor,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Get.theme.primaryColor.withOpacity(0.3),
                              Colors.transparent
                            ],
                          ),
                          show: true,
                          color:
                              Get.theme.primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // *** SELECTED TIME RANGE EXPANDED ***
            SizedBox(
              height: 40,
              child: Obx(
                () => customToggleButton(
                  isSelected: [
                    controller.selecedAllTimeGraph.value,
                    !controller.selecedAllTimeGraph.value
                  ],
                  onPressed: (int index) {
                    controller.timeUnit(index);
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'all records'.tr,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'last 30 days'.tr,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
