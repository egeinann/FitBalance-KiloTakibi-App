import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends GetView<Controller> {
  HomeScreen({super.key});
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
        physics: BouncingScrollPhysics(),
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
                  kcalAnimatedContainer(context),
                  const SizedBox(height: 10),
                  balanceAnimatedContainer(context),
                  const SizedBox(height: 10),
                  bmiAnimatedContainer(context),
                  const SizedBox(height: 150),
                  Padding(
                    padding: context.paddingLarge,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
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
                                    Text("Starting point",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                ),
                                Text(
                                  controller.records.isNotEmpty
                                      ? "${controller.records.first.weight} ${"kg"}"
                                      : "empty",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.changetargetweightscreen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Ionicons.ribbon),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Target point",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${controller.targetWeight} ${"kg"}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        heroTag: "onboarding",
        widget: Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.addscreen),
      ),
    );
  }

  Align bmiAnimatedContainer(BuildContext context) {
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
                  ? Theme.of(context).cardColor.withOpacity(0.4)
                  : Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: AutoSizeText(
                                "Calculate Body Mass Index",
                                textAlign: TextAlign.center,
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

  Align balanceAnimatedContainer(BuildContext context) {
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
                  ? Theme.of(context).cardColor.withOpacity(0.4)
                  : Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: AutoSizeText(
                                "How many calories should I eat per day?",
                                textAlign: TextAlign.center,
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

  Align kcalAnimatedContainer(BuildContext context) {
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
                  ? Theme.of(context).cardColor.withOpacity(0.4)
                  : Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: AutoSizeText(
                                "How many calories should I eat per day?",
                                textAlign: TextAlign.center,
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
