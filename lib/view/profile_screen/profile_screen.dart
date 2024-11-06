import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class ProfileScreen extends GetView<Controller> {
  ProfileScreen({super.key});

  final SettingsController _settingscontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLarge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              genderImage(),
              const SizedBox(height: 20),
              nameContainer(),
              const SizedBox(height: 5),
              targetWeightContainer(),
              const SizedBox(height: 5),
              premiumContainer(),
              SizedBox(height: Get.size.height * 0.1)
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
              key: ValueKey<bool>(_settingscontroller
                  .isMale.value), // Animasyonu tetiklemek için bir anahtar
              image: AssetImage(
                _settingscontroller.isMale.value
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
              _settingscontroller.isMale.value,
              !_settingscontroller.isMale.value
            ],
            onPressed: (int index) {
              _settingscontroller.toggleGender(index);
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Male'.tr,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Female'.tr,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // *** NAME CONTAINER ***
  Widget nameContainer() {
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
              Text("NAME".tr, style: Get.theme.textTheme.bodySmall),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.userName}",
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

  // *** TARGETWEIGHT CONTAINER ***
  Widget targetWeightContainer() {
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
              Text("TARGET WEIGHT".tr,
                  style: Get.theme.textTheme.bodySmall),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.targetWeight.value} ${"kg".tr}",
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

  // *** PREMIUM CONTAINER ***
  Widget premiumContainer() {
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
              Text("PREMIUM MODE".tr,
                  style: Get.theme.textTheme.bodySmall),
              Row(
                children: [
                  _settingscontroller.activePremium.value == true
                      ? Icon(Ionicons.rocket,
                          color: Get.theme.primaryColor)
                      : const Icon(
                          Ionicons.rocket,
                          color: Colors.grey,
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
}
