import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

final Controller controller = Get.find();
final SettingsController _settingsController = Get.find();
Obx lineGraph() {
  return Obx(
    () {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 20),
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
                        tooltipPadding: const EdgeInsets.all(5),
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
                              '${DateFormat('d MMM, y', Get.locale.toString()).format(record.dateTime)}\n${record.weight} ${_settingsController.weightUnit}',
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
                        strokeWidth: 1,
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
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              color: Get.theme.indicatorColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                          reservedSize: Get.size.height * 0.06,
                          getTitlesWidget: (value, meta) {
                            final date = DateTime.fromMillisecondsSinceEpoch(
                                value.toInt());

                            // İlk ve son tarihleri göster
                            int totalRecords =
                                controller.filteredRecords.length;
                            int index = controller.filteredRecords.indexWhere(
                              (record) =>
                                  record.dateTime.millisecondsSinceEpoch ==
                                  value.toInt(),
                            );

                            // Sadece ilk ve son indekslerde tarih göster
                            if (index == 0 || index == totalRecords - 1) {
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('d MMM', Get.locale.toString())
                                          .format(date),
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('y').format(date),
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox
                                  .shrink(); // Aradaki tarihlerde boş widget döndür
                            }
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.3), width: 1),
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
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [
                            Get.theme.focusColor.withOpacity(0.5),
                            Get.theme.focusColor.withOpacity(1)
                          ],
                        ),
                        preventCurveOverShooting: true,
                        isStepLineChart: false,
                        color: Get.theme.cardColor,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: controller.showDotData.value,
                        ),
                        belowBarData: BarAreaData(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Get.theme.focusColor.withOpacity(0.2),
                              Colors.transparent
                            ],
                          ),
                          show: true,
                          color: Get.theme.focusColor.withOpacity(0.5),
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
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
