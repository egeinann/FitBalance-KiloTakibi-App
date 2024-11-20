import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/services/instagram_service.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/divider.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/line_graph.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends GetView<Controller> {
  HomeScreen({super.key});
  final SettingsController _settingsController = Get.find();
  final RxDouble _1containerHeight = 80.0.obs;
  final RxDouble _1containerWidth = 120.0.obs;
  final RxBool _1isOpen = false.obs;

  final RxDouble _2containerHeight = 80.0.obs;
  final RxDouble _2containerWidth = 120.0.obs;
  final RxBool _2isOpen = false.obs;

  final RxDouble _3containerHeight = 80.0.obs;
  final RxDouble _3containerWidth = 120.0.obs;
  final RxBool _3isOpen = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Image(
                      image: AssetImage("assets/images/weightInfo/water.png"),
                      fit: BoxFit.scaleDown,
                      height: 400,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      const SizedBox(
                        height: 10,
                      ),
                      kcalAnimatedContainer(),
                      const SizedBox(height: 10),
                      balanceAnimatedContainer(),
                      const SizedBox(height: 10),
                      bmiAnimatedContainer(),
                      const SizedBox(height: 120),
                      Padding(
                        padding: context.paddingLarge,
                        child: Column(
                          children: [
                            premiumInformationContainer(),
                            const SizedBox(height: 20),
                            const CustomDivider(),
                            const SizedBox(height: 20),
                            startingPointContainer(),
                            const SizedBox(height: 5),
                            targetPointContainer(),
                            const SizedBox(height: 20),
                            imageColorfull(),
                            const SizedBox(height: 20),
                            aiContainer(),
                            const SizedBox(height: 20),
                            const CustomDivider(),
                            const SizedBox(height: 20),
                            imagePhotoText(),
                            const SizedBox(height: 20),
                            const CustomDivider(),
                            const SizedBox(height: 20),
                            instagramContainer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: customFloatingActionButton(
                heroTag: "onboarding",
                widget: const Icon(Icons.add),
                onPressed: () => Get.toNamed(Routes.addscreen),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // *** URL INSTAGRAM CONTAINER ***
  GestureDetector instagramContainer() {
    return GestureDetector(
      onTap: InstagramService().launchInstagram,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.theme.cardColor.withOpacity(0.4),
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: Image(
                image: AssetImage(
                  "assets/images/mainScreen/home_instagram.png",
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Follow us on Instagram for healthy living tips!".tr,
                    style: Get.theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Visit".tr,
                        style: Get.theme.textTheme.bodySmall,
                      ),
                      const Icon(
                        Ionicons.chevron_forward,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *** PHOTO IMAGE AND TEXT SIZEDBOX ***
  SizedBox imagePhotoText() {
    return SizedBox(
      height: 250,
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage(
                  "assets/images/mainScreen/home_photo.png",
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  "Better Tracking with Memories! Have You Tried Adding Photos?"
                      .tr,
                  style: Get.theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const Column(
                  children: [
                    Icon(Ionicons.camera),
                    CustomDivider(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // *** AI CONTAINER ***
  Container aiContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.theme.cardColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Healthier suggestions with artificial intelligence!".tr,
                  style: Get.theme.textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                customFloatingActionButtonYellow(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Ionicons.rocket),
                      const SizedBox(width: 5),
                      AutoSizeText(
                        "Try Premium".tr,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.upgradepremiumscreen);
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/mainScreen/home_ai.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }

  // *** IMAGE COLORFULL ***
  Widget imageColorfull() {
    return const Image(
      image: AssetImage(
        "assets/images/mainScreen/home_colorfull.png",
      ),
      fit: BoxFit.scaleDown,
      height: 200,
    );
  }

  // *** PREMIUM INFORMATION CONTAINER ***
  Widget premiumInformationContainer() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // İçerik (lineGraph)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Get.theme.focusColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.cardColor.withOpacity(0.5), // Hafif opaklık
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    fit: BoxFit.cover, // İçerik sığdırma
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: Get.size.width, // Genişlik ayarı
                      height: 300, // lineGraph yüksekliği
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: controller.records.length >= 7
                            ? homeLineChart()
                            : Obx(
                                () => _settingsController.hasPaid.value
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.show_chart,
                                              size: 40,
                                            ),
                                            AutoSizeText(
                                              "There must be 7 or more data".tr,
                                              textAlign: TextAlign.center,
                                              style:
                                                  Get.theme.textTheme.bodyLarge,
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              // Bulanık arka plan
              Obx(
                () => Visibility(
                  visible: !_settingsController.hasPaid.value,
                  child: Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Köşe yuvarlama
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 5, sigmaY: 5), // Bulanıklık miktarı
                        child: Container(
                          color: Colors.transparent, // Transparan arka plan
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !_settingsController.hasPaid.value,
                  child: Column(
                    children: [
                      const Icon(Ionicons.lock_closed),
                      Text(
                        "Charts".tr,
                        style: Get.theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 1,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.theme.cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  child: Image(
                    image: AssetImage("assets/images/mainScreen/home_ai_2.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                customFloatingActionButtonYellow(
                  widget: Padding(
                    padding: const EdgeInsets.all(5),
                    child: AutoSizeText(
                      "ChatBot".tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.chatbotinfoscreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // *** PREMIUM LINE CHART ***
  Widget homeLineChart() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: LineChart(
          key: ValueKey<bool>(
              controller.selecedAllTimeGraph.value), // 3. ValueKey eklendi
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 200),
          LineChartData(
            lineTouchData: const LineTouchData(
              handleBuiltInTouches: false,
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
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
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
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text(
                    value.toInt().toString(),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      color: Get.theme.indicatorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              bottomTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
            ),
            minX: controller.filteredRecords.isNotEmpty
                ? controller
                    .filteredRecords.first.dateTime.millisecondsSinceEpoch
                    .toDouble()
                : 0,
            maxX: controller.filteredRecords.isNotEmpty
                ? controller
                    .filteredRecords.last.dateTime.millisecondsSinceEpoch
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
                          record.dateTime.millisecondsSinceEpoch.toDouble(),
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
                dotData: const FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Get.theme.focusColor.withOpacity(0.3),
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
    );
  }

  // *** TARGET POINT CONTAINER ***
  GestureDetector targetPointContainer() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.changetargetweightscreen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.theme.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Ionicons.ribbon),
                  const SizedBox(width: 5),
                  Text(
                    "Target point".tr,
                    style: Get.theme.textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.targetWeight} ${_settingsController.weightUnit}",
                      style: Get.theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Ionicons.chevron_forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** STARTING POINT ***
  GestureDetector startingPointContainer() {
    return GestureDetector(
      onTap: () {
        controller.records.isNotEmpty
            ? Get.toNamed(Routes.recordscreen,
                arguments: controller.records.first)
            : null;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.theme.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Ionicons.flag),
                  const SizedBox(width: 5),
                  Text("Starting point".tr,
                      style: Get.theme.textTheme.bodySmall),
                ],
              ),
              Row(
                children: [
                  Text(
                    controller.records.isNotEmpty
                        ? "${controller.records.first.weight} ${_settingsController.weightUnit}"
                        : "empty".tr,
                    style: Get.theme.textTheme.labelSmall,
                  ),
                  const SizedBox(width: 5),
                  Obx(
                    () => Icon(
                      controller.records.isEmpty
                          ? Icons.data_array
                          : Ionicons.chevron_forward,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** ANIMATED CONTAINER BMI ***
  Align bmiAnimatedContainer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            _3isOpen.value = !_3isOpen.value;
            _3containerWidth.value =
                _3isOpen.value ? Get.size.width * 0.8 : 120;
            _3containerHeight.value = _3isOpen.value ? 400 : 80;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _3containerHeight.value,
            width: _3containerWidth.value,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
              color: _3isOpen.value
                  ? Get.theme.cardColor.withOpacity(0.4)
                  : Get.theme.primaryColor,
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !_3isOpen.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Ionicons.speedometer,
                              color: Get.theme.dialogBackgroundColor),
                          const SizedBox(height: 5),
                          Text(
                            "BMI".tr,
                            style: TextStyle(
                              color: Get.theme.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _3isOpen.value,
                      child: Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Lottie.asset(
                                'assets/lottie/homeBmi.json',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: textTyperAnimated(
                                text: "Calculate Body Mass Index".tr,
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: customFloatingActionButton(
                                heroTag: "bmi",
                                widget: const Icon(Ionicons.speedometer),
                                onPressed: () {
                                  Get.toNamed(Routes.bmiscreen);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // *** ANIMATED CONATINER BALANCE INFORMATION ***
  Align balanceAnimatedContainer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            _2isOpen.value = !_2isOpen.value;
            _2containerWidth.value =
                _2isOpen.value ? Get.size.width * 0.8 : 120;
            _2containerHeight.value = _2isOpen.value ? 400 : 80;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _2containerHeight.value,
            width: _2containerWidth.value,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
              color: _2isOpen.value
                  ? Get.theme.cardColor.withOpacity(0.4)
                  : Get.theme.primaryColor,
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !_2isOpen.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Ionicons.pulse,
                              color: Get.theme.scaffoldBackgroundColor),
                          const SizedBox(height: 5),
                          Text(
                            "Balance".tr,
                            style: TextStyle(
                              color: Get.theme.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _2isOpen.value,
                      child: Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Lottie.asset(
                                'assets/lottie/homeInfo.json',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: textTyperAnimated(
                                text: "How can I control my weight?".tr,
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: customFloatingActionButton(
                                heroTag: "balance",
                                widget: const Icon(Ionicons.pulse),
                                onPressed: () {
                                  Get.toNamed(Routes.infoscreen);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // *** ANIMATED CONTAINER KCAL ***
  Align kcalAnimatedContainer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            _1isOpen.value = !_1isOpen.value;
            _1containerWidth.value =
                _1isOpen.value ? Get.size.width * 0.8 : 120;
            _1containerHeight.value = _1isOpen.value ? 400 : 80;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _1containerHeight.value,
            width: _1containerWidth.value,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
              color: _1isOpen.value
                  ? Get.theme.cardColor.withOpacity(0.4)
                  : Get.theme.primaryColor,
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !_1isOpen.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Ionicons.fast_food,
                              color: Get.theme.scaffoldBackgroundColor),
                          const SizedBox(height: 5),
                          Text(
                            "kcal/day".tr,
                            style: TextStyle(
                              color: Get.theme.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _1isOpen.value,
                      child: Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Lottie.asset(
                                'assets/lottie/homeKcal.json',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: textTyperAnimated(
                                text: "How many calories should I eat per day?"
                                    .tr,
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: customFloatingActionButton(
                                widget: const Icon(Ionicons.fast_food),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
