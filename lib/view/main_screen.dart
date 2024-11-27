import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/navigation_bar.dart';

class MainScreen extends GetView<Controller> {
  MainScreen({super.key});
  final SettingsController _settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Obx(
          () {
            switch (controller.currentTabIndex.value) {
              case 0:
                return controller.graphPageIndex.value != 1 &&
                        controller.records.isNotEmpty &&
                        _settingsController.hasPaid.value
                    ? Listener(
                        onPointerDown: (_) {
                          controller.dotData(true);
                        },
                        onPointerUp: (_) {
                          controller.dotData(false);
                        },
                        child: const Icon(Ionicons.analytics),
                      )
                    : const SizedBox();
              default:
                return IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.chatscreen);
                  },
                  icon: const Icon(Ionicons.chatbox_ellipses),
                );
            }
          },
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            controller.appBarTitle.value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () {
              switch (controller.currentTabIndex.value) {
                case 0:
                  return controller.records.isNotEmpty &&
                          _settingsController.hasPaid.value
                      ? SizedBox(
                          child: controller.graphPageIndex.value == 0
                              ? IconButton(
                                  onPressed: () {
                                    controller.pageController.animateToPage(
                                      1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                    controller.onPageChanged(
                                        1); // Sayfa indeksini güncelle
                                  },
                                  icon: const Icon(Ionicons.arrow_down),
                                )
                              : IconButton(
                                  onPressed: () {
                                    controller.pageController.animateToPage(
                                      0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                    controller.onPageChanged(
                                        0); // Sayfa indeksini güncelle
                                  },
                                  icon: const Icon(Ionicons.arrow_up),
                                ),
                        )
                      : const SizedBox();
                case 4:
                  return IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.settingsscreen);
                    },
                    icon: const Icon(Ionicons.settings),
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ],
      ),
      body: Obx(
        () {
          return indexedStack();
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return bottomNavigationBar(
              context); // CustomBottomNavigationBar, gözlemlenen değişkeni içerir
        },
      ),
    );
  }
}
