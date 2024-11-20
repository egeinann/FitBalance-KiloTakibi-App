import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/services/email_service.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/settings_model.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final settingsList = [
      SettingsModel(
        const Icon(Ionicons.rocket),
        "Premium".tr,
        "Upgrade to Premium".tr,
        Icon(
          Ionicons.rocket,
          color: controller.hasPaid.value ? Get.theme.focusColor : Colors.grey,
        ),
        onTap: () {
          Get.toNamed(Routes.upgradepremiumscreen);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.earth),
        "Language".tr,
        null,
        Obx(
          () => Text(
            controller.selectedLanguage.toString(),
            style: const TextStyle(fontFamily: "Poppins", fontSize: 16),
          ),
        ),
        onTap: () {
          _showLanguageSelectionBottomSheet();
        },
      ),
      SettingsModel(
        const Icon(Icons.format_color_fill_rounded),
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
        const Icon(Ionicons.speedometer),
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
        const Icon(Ionicons.man),
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
        const Icon(Ionicons.lock_closed),
        "Privacy Policy".tr,
        "Protection of personal data".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.privacypolicyscreen);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.document_text),
        "Terms of service".tr,
        "You have accepted these terms".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.termsofservicescreen);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.cloud),
        "Data management".tr,
        "Data backup, restore and data wipe".tr,
        null,
        onTap: () {
          Get.toNamed(Routes.datamanagementscreen);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.information_circle),
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
          widget: const Icon(Ionicons.mail),
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

  // *** DİL SEÇİMİ İÇİN BOTTOMSHEET ***
  void _showLanguageSelectionBottomSheet() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20), // Yanlardan boşluk ekliyoruz
        child: Container(
          padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Get.theme.primaryColor, // Arka plan rengi aynı kalır
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.languageOptions.entries.map((entry) {
              final languageCode = entry.key;
              final languageName = entry.value;

              return Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: controller.selectedLanguage.value == languageCode
                          ? Get.theme.cardColor // Seçili dilin rengi
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
              });
            }).toList(),
          ),
        ),
      ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }

}
