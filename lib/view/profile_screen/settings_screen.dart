import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Controller _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    final settingsList = [
      SettingsModel(
        const Icon(Ionicons.earth),
        "Language",
        null,
        Obx(
          () => Text(
            _controller.selectedLanguage.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        onTap: () {
          _showLanguageSelectionBottomSheet(context);
        },
      ),
      SettingsModel(
        const Icon(Ionicons.color_palette),
        "Theme",
        null,
        SizedBox(
          width: Get.size.width * 0.15,
          child: DayNightSwitcher(
            isDarkModeEnabled: _controller.themeMode.value == ThemeMode.dark,
            onStateChanged: (isDarkModeEnabled) {
              _controller.switchTheme(isDarkModeEnabled);
            },
          ),
        ),
        onTap: () {
          bool isDarkModeEnabled =
              _controller.themeMode.value == ThemeMode.dark;
          _controller.switchTheme(!isDarkModeEnabled);
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
            value: _controller.isNotificationsEnabled.value,
            onChanged: (isEnabled) {
              _controller.toggleNotifications(isEnabled);
            },
          ),
        ),
        onTap: () {
          _controller.isNotificationsEnabled.value =
              !_controller.isNotificationsEnabled.value;
        },
      ),
      SettingsModel(
        const Icon(Ionicons.lock_closed),
        "Privacy Policy",
        "Privacy Policy and Terms of Use",
        null,
        onTap: () {},
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
        padding: const EdgeInsets.all(20),
        child: CustomFloatingActionButton(
          heroTag: "profile",
          widget: const Icon(Ionicons.mail),
          onPressed: () {},
        ),
      ),
    );
  }

  void _showLanguageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => ListTile(
                    title: Text('Türkçe',
                        style: Theme.of(context).textTheme.bodyLarge),
                    tileColor: _controller.selectedLanguage.value == 'tr'
                        ? Theme.of(context).cardColor
                        : null,
                    onTap: () {
                      _controller.changeLanguage('tr');
                      Navigator.of(context).pop();
                    },
                  )),
              Obx(() => ListTile(
                    title: Text('English',
                        style: Theme.of(context).textTheme.bodyLarge),
                    tileColor: _controller.selectedLanguage.value == 'en'
                        ? Theme.of(context).cardColor
                        : null,
                    onTap: () {
                      _controller.changeLanguage('en');
                      Navigator.of(context).pop();
                    },
                  )),
              Obx(
                () => ListTile(
                  title: Text('Español',
                      style: Theme.of(context).textTheme.bodyLarge),
                  tileColor: _controller.selectedLanguage.value == 'es'
                      ? Theme.of(context).cardColor
                      : null,
                  onTap: () {
                    _controller.changeLanguage('es');
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
