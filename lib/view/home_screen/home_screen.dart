import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
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
      body: SingleChildScrollView(
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
                children: [
                  const SizedBox(height: 30),
                  kcalAnimatedContainer(),
                  const SizedBox(height: 10),
                  balanceAnimatedContainer(),
                  const SizedBox(height: 10),
                  bmiAnimatedContainer(),
                  const SizedBox(height: 120),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        premiumInformationContainer(),
                        const SizedBox(height: 20),
                        startingPointContainer(),
                        const SizedBox(height: 5),
                        targetPointContainer(),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Image(
                                image: AssetImage(
                                    "assets/images/mainScreen/home_colorfull.png"),
                                fit: BoxFit.scaleDown,
                                height: 200,
                              ),
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Get.theme.cardColor,
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text("data"),
                                    ),
                                  ),
                                  Expanded(
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/mainScreen/home_premium_ai.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
      floatingActionButton: CustomFloatingActionButton(
        heroTag: "onboarding",
        widget: const Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.addscreen),
      ),
    );
  }

  // *** PREMIUM INFORMATION CONTAINER ***
  Stack premiumInformationContainer() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Row(
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
                        width: 2,
                        color: Get.theme.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color:
                          Get.theme.cardColor.withOpacity(0.5), // Hafif opaklık
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FittedBox(
                        fit: BoxFit.cover, // İçerik sığdırma
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: Get.size.width, // Genişlik ayarı
                          height: 300, // lineGraph yüksekliği
                          child: lineGraph(),
                        ),
                      ),
                    ),
                  ),
                  // Bulanık arka plan
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Köşe yuvarlama
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 7, sigmaY: 7), // Bulanıklık miktarı
                        child: Container(
                          color: Colors.transparent, // Transparan arka plan
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(Ionicons.lock_closed),
                      Text(
                        "Charts",
                        style: Get.theme.textTheme.bodyLarge,
                      ),
                    ],
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
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CustomFloatingActionButton(
            heroTag: "HOME",
            widget: const Icon(Ionicons.rocket),
            onPressed: () {},
          ),
        ),
      ],
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
                    "Target point",
                    style: Get.theme.textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.targetWeight} ${"kg"}",
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
  Container startingPointContainer() {
    return Container(
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
                Text("Starting point", style: Get.theme.textTheme.bodySmall),
              ],
            ),
            Text(
              controller.records.isNotEmpty
                  ? "${controller.records.first.weight} ${"kg"}"
                  : "empty",
              style: Get.theme.textTheme.labelSmall,
            ),
          ],
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
                          const Icon(Ionicons.speedometer),
                          const SizedBox(height: 5),
                          Text(
                            "BMI",
                            style: Get.theme.textTheme.bodyMedium,
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
                              padding: EdgeInsets.all(10),
                              child: textTyperAnimated(
                                text: "Calculate Body Mass Index",
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: CustomFloatingActionButton(
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
                          const Icon(Ionicons.pulse),
                          const SizedBox(height: 5),
                          Text(
                            "Balance",
                            style: Get.theme.textTheme.bodyMedium,
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
                              padding: EdgeInsets.all(10),
                              child: textTyperAnimated(
                                text: "How can I control my weight?",
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: CustomFloatingActionButton(
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
                          const Icon(Ionicons.fast_food),
                          const SizedBox(height: 5),
                          Text(
                            "kcal/day",
                            style: Get.theme.textTheme.bodyMedium,
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
                                text: "How many calories should I eat per day?",
                                textStyle: Get.theme.textTheme.bodyMedium!,
                                isRepeat: false,
                              ),
                            ),
                            Flexible(
                              child: CustomFloatingActionButton(
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
