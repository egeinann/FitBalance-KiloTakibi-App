import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';

import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/services/email_service.dart';
import 'package:kilo_takibi_uyg/widgets/bottom_sheet.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/settings_model/settings_model.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final settingsList = [
      SettingsModel(
        const Icon(AppIcons.rocket),
        "Premium".tr,
        "Upgrade to Premium".tr,
        Icon(
          AppIcons.rocket,
          color: controller.hasPaid.value ? Get.theme.focusColor : Colors.grey,
        ),
        onTap: () {
          Get.toNamed(Routes.upgradepremiumscreen);
        },
      ),
      SettingsModel(
        const Icon(AppIcons.language),
        "Language".tr,
        null,
        Obx(
          () => Text(
            controller.selectedLanguage.toString(),
            style: const TextStyle(fontFamily: "Poppins", fontSize: 16),
          ),
        ),
        onTap: () {
          BottomSheetHelper.showCustomBottomSheet(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: controller.languageOptions.entries.map(
                    (entry) {
                      final languageCode = entry.key;
                      final languageName = entry.value;
                      return Obx(
                        () {
                          return Container(
                            decoration: BoxDecoration(
                              color: controller.selectedLanguage.value ==
                                      languageCode
                                  ? Get.theme.primaryColor // Seçili dilin rengi
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(languageName),
                              onTap: () {
                                controller.changeLanguage(languageCode);
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => Get.back(),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              color: Get.theme.canvasColor);
        },
      ),
      SettingsModel(
        const Icon(AppIcons.theme),
        "Theme".tr,
        null,
        SizedBox(
          width: 65,
          child: Obx(
            () => DayNightSwitcher(
              isDarkModeEnabled: controller.themeMode.value == ThemeMode.dark,
              onStateChanged: (isDarkModeEnabled) {
                controller.switchTheme(isDarkModeEnabled);
              },
            ),
          ),
        ),
        onTap: () {
          bool isDarkModeEnabled = controller.themeMode.value == ThemeMode.dark;
          controller.switchTheme(!isDarkModeEnabled);
        },
      ),
      // SettingsModel(
      //   const Icon(Ionicons.notifications),
      //   "Notifications".tr,
      //   "Reminder for process tracking".tr,
      //   Obx(
      //     () => Switch(
      //       inactiveThumbColor: const Color.fromARGB(255, 255, 17, 0),
      //       activeColor: const Color.fromARGB(255, 0, 255, 8),
      //       activeTrackColor: Get.theme.cardColor,
      //       value: controller.isNotificationEnabled.value,
      //       onChanged: (value) {
      //         controller.isNotificationEnabled.value = value;
      //       },
      //     ),
      //   ),
      //   onTap: () {
      //   },
      // ),
      SettingsModel(
        const Icon(AppIcons.indicator),
        "Unit of weight".tr,
        null,
        Obx(
          () => customToggleButton(
            isSelected: [
              controller.isKgSelected.value,
              !controller.isKgSelected.value
            ],
            onPressed: (int index) {
              controller.toggleWeightUnit();
            },
            children: [
              Text(
                'kg'.tr,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                'lbs'.tr,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          controller.toggleWeightUnit();
        },
      ),
      SettingsModel(
        const Icon(AppIcons.man),
        "Unit of height".tr,
        null,
        SizedBox(
          height: 45,
          child: Obx(
            () => customToggleButton(
              isSelected: [
                controller.isCmSelected.value, // Eğer cm seçiliyse true
                !controller
                    .isCmSelected.value, // Eğer cm seçili değilse ft seçili
              ],
              onPressed: (_) {
                controller.toggleHeightUnit(
                    170); // Butona tıklanınca toggleHeightUnit'i çağır
              },
              children: [
                Text(
                  'cm'.tr,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  'ft'.tr,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          controller
              .toggleHeightUnit(1.75); // Burada da aynı fonksiyonu çağırıyoruz
        },
      ),
      SettingsModel(
        const Icon(AppIcons.lock),
        "Privacy Policy".tr,
        "Protection of personal data".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.privacypolicyscreen);
        },
      ),
      SettingsModel(
        const Icon(AppIcons.documents),
        "Terms of service".tr,
        "You have accepted these terms".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.termsofservicescreen);
        },
      ),
      SettingsModel(
        const Icon(AppIcons.cloud),
        "Data management".tr,
        "Data backup, restore and data wipe".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.datamanagementscreen);
        },
      ),
      SettingsModel(
        const Icon(AppIcons.information),
        "About the app".tr,
        null,
        null,
        onTap: () {
          Get.toNamed(Routes.abouttheappscreen);
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Settings'.tr, style: Get.theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:
              settingsList.length + 1, // Liste uzunluğunu bir artırıyoruz
          itemBuilder: (context, index) {
            if (index == settingsList.length) {
              return const SizedBox(
                  height: 100); // Son öğe boşluk olarak eklendi
            }
            return ListTile(
              leading: settingsList[index].icon,
              title: Text(
                settingsList[index].text,
                style: const TextStyle(fontFamily: "Poppins"),
              ),
              subtitle: settingsList[index].subText != null
                  ? Text(
                      settingsList[index].subText!,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: const Color.fromARGB(255, 129, 129, 129)
                            .withOpacity(0.8),
                      ),
                    )
                  : null, // subText null ise subtitle boş kalır
              trailing: settingsList[index].widget,
              onTap: settingsList[index].onTap,
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 5),
        child: customFloatingActionButton(
          heroTag: "profile",
          widget: const Icon(AppIcons.mail),
          onPressed: () {
            final emailService = EmailService();
            emailService.sendEmail(
              to: 'fitbalance.contact@gmail.com',
            );
          },
        ),
      ),
    );
  }
}
