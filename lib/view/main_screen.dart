import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/navigation_bar.dart';

class MainScreen extends GetView<Controller> {
  MainScreen({super.key});
  final SettingsController _settingsController = Get.find();
  final UserController _userController = Get.find();
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
                        child: const Icon(AppIcons.analytics),
                      )
                    : const SizedBox();
              default:
                return IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.chatscreen);
                  },
                  icon: const Icon(AppIcons.chatBox),
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
                                  icon: const Icon(AppIcons.arrowDown),
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
                                  icon: const Icon(AppIcons.arrowUp),
                                ),
                        )
                      : const SizedBox();
                case 1:
                  return IconButton(
                    onPressed: () {
                      controller.currentTabIndex.value = 4;
                    },
                    icon: _userController.user.value.userAvatar == null
                        ? CircleAvatar(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/profile/female.png"),
                              fit: BoxFit.scaleDown,
                              height: Get.size.height * 0.2,
                              alignment: Alignment.center,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: const Color(0xFF85c5e5),
                            child: SvgPicture.asset(
                                _userController.user.value.userAvatar!),
                          ),
                  );
                case 2:
                  return IconButton(
                    onPressed: () {
                      controller.currentTabIndex.value = 4;
                    },
                    icon: _userController.user.value.userAvatar == null
                        ? CircleAvatar(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/profile/female.png"),
                              fit: BoxFit.scaleDown,
                              height: Get.size.height * 0.2,
                              alignment: Alignment.center,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: const Color(0xFF85c5e5),
                            child: SvgPicture.asset(
                                _userController.user.value.userAvatar!),
                          ),
                  );
                case 3:
                  return IconButton(
                    onPressed: () {
                      controller.currentTabIndex.value = 4;
                    },
                    icon: _userController.user.value.userAvatar == null
                        ? CircleAvatar(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/profile/female.png"),
                              fit: BoxFit.scaleDown,
                              height: Get.size.height * 0.2,
                              alignment: Alignment.center,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: const Color(0xFF85c5e5),
                            child: SvgPicture.asset(
                                _userController.user.value.userAvatar!),
                          ),
                  );
                case 4:
                  return IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.settingsscreen);
                    },
                    icon: const Icon(AppIcons.settings),
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
