import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/privacyPolicy_screen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/termsOfService_screen.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController _settingscontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    final settingsList = [
      SettingsModel(
        const Icon(Ionicons.earth),
        "Language",
        null,
        Obx(
          () => Text(
            _settingscontroller.selectedLanguage.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        onTap: () {
          _showLanguageSelectionBottomSheet();
        },
      ),
      SettingsModel(
        const Icon(Icons.format_color_fill_rounded),
        "Theme",
        null,
        SizedBox(
          width: Get.size.width * 0.15,
          child: DayNightSwitcher(
            isDarkModeEnabled:
                _settingscontroller.themeMode.value == ThemeMode.dark,
            onStateChanged: (isDarkModeEnabled) {
              _settingscontroller.switchTheme(isDarkModeEnabled);
            },
          ),
        ),
        onTap: () {
          bool isDarkModeEnabled =
              _settingscontroller.themeMode.value == ThemeMode.dark;
          _settingscontroller.switchTheme(!isDarkModeEnabled);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.notifications),
        "Notifications",
        "Reminder for process tracking",
        Obx(
          () => Switch(
            inactiveThumbColor: const Color.fromARGB(255, 255, 17, 0),
            activeColor: const Color.fromARGB(255, 0, 255, 8),
            activeTrackColor: Theme.of(context).cardColor,
            value: _settingscontroller.isNotificationsEnabled.value,
            onChanged: (isEnabled) {
              _settingscontroller.toggleNotifications(isEnabled);
            },
          ),
        ),
        onTap: () {
          _settingscontroller.isNotificationsEnabled.value =
              !_settingscontroller.isNotificationsEnabled.value;
        },
      ),
      SettingsModel(
        const Icon(Ionicons.lock_closed),
        "Privacy Policy",
        "Privacy Policy",
        null,
        onTap: () {
          Get.to(const PrivacyPolicyScreen());
        },
      ),
      SettingsModel(
        const Icon(Ionicons.document_text),
        "Terms of service",
        "You have accepted these terms.",
        null,
        onTap: () {
          Get.to(const TermsOfServiceScreen());
        },
      ),
      SettingsModel(
        const Icon(Ionicons.cloud),
        "Data management",
        "Data backup, restore and data wipe",
        null,
        onTap: () {},
      ),
      SettingsModel(
        const Icon(Ionicons.information_circle),
        "About the app",
        null,
        null,
        onTap: () {},
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: ListView.builder(
          itemCount: settingsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: settingsList[index].icon,
              title: Text(settingsList[index].text,
                  style: Theme.of(context).textTheme.bodyLarge),
              subtitle: settingsList[index].subText != null
                  ? Text(
                      settingsList[index].subText!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .color!
                                .withOpacity(0.6),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: CustomFloatingActionButton(
          heroTag: "profile",
          widget: const Icon(Ionicons.mail),
          onPressed: () {},
        ),
      ),
    );
  }

  // dil seçimi
  void _showLanguageSelectionBottomSheet() {
    final languageOptions = {
      'tr': 'Türkçe',
      'en': 'English',
      'es': 'Español',
      'fr': 'Français',
      'de': 'Deutsch',
      'pt': 'Português',
      'zh': '中国人',
    };

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: languageOptions.entries.map((entry) {
            final languageCode = entry.key;
            final languageName = entry.value;

            return Obx(() {
              return Container(
                decoration: BoxDecoration(
                  color:
                      _settingscontroller.selectedLanguage.value == languageCode
                          ? Theme.of(context).cardColor
                          : null,
                  borderRadius:
                      BorderRadius.circular(12), // Seçili olan itemin köşeleri
                ),
                child: ListTile(
                  title: Text(languageName),
                  onTap: () {
                    _settingscontroller.changeLanguage(languageCode);
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
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
