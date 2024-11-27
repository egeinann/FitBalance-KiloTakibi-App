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
      final filteredRecords = controller.filteredRecords; // Güncel listeyi al
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            // Zaman Aralığı Metni
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                controller.selecedAllTimeGraph.value
                    ? "All records".tr
                    : "Records of the last 30 days".tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
            ),
            // Çizgi Grafik
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: LineChart(
                  key: ValueKey<bool>(controller.selecedAllTimeGraph.value),
                  LineChartData(
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          label: HorizontalLineLabel(
                            show: true,
                            style: const TextStyle(
                              color: Colors.green, // Etiket rengi
                              fontSize: 10, // Etiket font boyutu
                              fontWeight:
                                  FontWeight.bold, // Etiket font kalınlığı
                              fontFamily: "Poppins",
                            ),
                            alignment: Alignment
                                .topRight, // Etiketin konumu (başka seçenekler de var)
                          ),
                          y: controller.targetWeight
                              .toDouble(), // Hedef kiloyu burada kullanıyoruz
                          color: Colors.green, // Çizginin rengi
                          strokeWidth: 2, // Çizginin kalınlığı
                          dashArray: [
                            5,
                            5
                          ], // Çizgi noktalı olmasını istiyorsanız
                        ),
                      ],
                    ),
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipRoundedRadius: 8,
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        getTooltipColor: (group) => Get.theme.primaryColor,
                        tooltipPadding: const EdgeInsets.all(5),
                        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                          return touchedBarSpots.map((barSpot) {
                            final record = filteredRecords[barSpot.x.toInt()];
                            return LineTooltipItem(
                              '${DateFormat('d MMM, y', Get.locale?.languageCode ?? 'en').format(record.dateTime)}\n${record.weight} ${_settingsController.weightUnit}',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
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
                          reservedSize: 30,
                          showTitles: true,
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
                          reservedSize: Get.size.height * 0.06,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            // Tarih formatlarını ayır
                            DateTime firstDate = filteredRecords.first.dateTime;
                            DateTime lastDate = filteredRecords.last.dateTime;

                            String firstDayMonth = DateFormat(
                                    'd MMM', Get.locale?.languageCode ?? 'en')
                                .format(firstDate);
                            String firstYear =
                                DateFormat('y').format(firstDate);

                            String lastDayMonth = DateFormat(
                                    'd MMM', Get.locale?.languageCode ?? 'en')
                                .format(lastDate);
                            String lastYear = DateFormat('y').format(lastDate);
                            if (value == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      firstDayMonth,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      firstYear,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (value == filteredRecords.length - 1) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 25, top: 3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      lastDayMonth,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      lastYear,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // Diğer değerler için boş bırak (gerekirse ayarla)
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    minX: 0,
                    maxX: filteredRecords.isNotEmpty
                        ? (filteredRecords.length - 1).toDouble()
                        : 1,
                    minY: filteredRecords.isNotEmpty
                        ? filteredRecords
                                .map((e) => e.weight)
                                .reduce((a, b) => a < b ? a : b) -
                            5
                        : 0,
                    maxY: filteredRecords.isNotEmpty
                        ? filteredRecords
                                .map((e) => e.weight)
                                .reduce((a, b) => a > b ? a : b) +
                            5
                        : 10,
                    lineBarsData: [
                      LineChartBarData(
                        spots: filteredRecords
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                                entry.key.toDouble(),
                                entry.value.weight,
                              ),
                            )
                            .toList(),
                        preventCurveOverShooting: true,
                        isStepLineChart: false,
                        color: Get.theme.primaryColor,
                        isCurved: false,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: controller.showDotData.value,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Get.theme.primaryColor.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Zaman Aralığı Butonları
            Obx(
              () => customToggleButton(
                isSelected: [
                  controller.selecedAllTimeGraph.value,
                  !controller.selecedAllTimeGraph.value,
                ],
                onPressed: (index) {
                  controller.timeUnit(index);
                },
                children: [
                  Text('All records'.tr),
                  Text('Last 30 days'.tr),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
