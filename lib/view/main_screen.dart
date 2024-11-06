import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/navigation_bar.dart';

class MainScreen extends GetView<Controller> {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.chatscreen);
          },
          icon: const Icon(Ionicons.chatbox_ellipses),
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
            () => controller.currentTabIndex.value == 4
                ? IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.settingsscreen);
                    },
                    icon: const Icon(Ionicons.settings),
                  )
                : const SizedBox(),
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
