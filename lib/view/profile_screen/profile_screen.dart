import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class ProfileScreen extends GetView<Controller> {
  ProfileScreen({super.key});
  final SettingsController _settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLarge,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              genderImage(),
              const SizedBox(height: 20),
              Column(
                children: [
                  nameContainer(),
                  const SizedBox(height: 5),
                  targetContainer(),
                  const SizedBox(height: 5),
                  premiumContainer(),
                ],
              ),
              SizedBox(height: Get.size.height * 0.1)
            ],
          ),
        ),
      ),
    );
  }

  // *** PREMIUM CONTAINER ***
  GestureDetector premiumContainer() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.upgradepremiumscreen);
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
                  const Icon(AppIcons.ribbon),
                  const SizedBox(width: 5),
                  Text("PREMIUM MODE".tr, style: Get.theme.textTheme.bodySmall),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Icon(
                      AppIcons.rocket,
                      color: _settingsController.hasPaid.value
                          ? Get.theme.focusColor
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(AppIcons.forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** TARGET WEIGHT CONTAINER ***
  GestureDetector targetContainer() {
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
                  const Icon(AppIcons.flag),
                  const SizedBox(width: 5),
                  Text("TARGET WEIGHT".tr,
                      style: Get.theme.textTheme.bodySmall),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.targetWeight.value} ${_settingsController.weightUnit}",
                      style: Get.theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(AppIcons.forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** NAME CONTAINER ***
  GestureDetector nameContainer() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.changenamescreen);
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
                  const Icon(AppIcons.person),
                  const SizedBox(width: 5),
                  Text("NAME".tr, style: Get.theme.textTheme.bodySmall),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      controller.userName.value,
                      style: Get.theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(AppIcons.forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** GENDER TOP IMAGE ***
  Widget genderImage() {
    return Obx(
      () => Column(
        children: [
          // RESİM
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300), // Animasyon süresi
            child: Image(
              key: ValueKey<bool>(_settingsController
                  .isMale.value), // Animasyonu tetiklemek için bir anahtar
              image: AssetImage(
                _settingsController.isMale.value
                    ? "assets/images/profile/male.png"
                    : "assets/images/profile/female.png",
              ),
              fit: BoxFit.scaleDown,
              height: Get.size.height * 0.2,
            ),
          ),
          const SizedBox(height: 10),
          // TOGGLEBUTTONLAR
          customToggleButton(
            isSelected: [
              _settingsController.isMale.value,
              !_settingsController.isMale.value
            ],
            onPressed: (int index) {
              _settingsController.toggleGender(index);
            },
            children: [
              Text(
                'Male'.tr,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                'Female'.tr,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
