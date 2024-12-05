import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/bottom_sheet.dart';
import 'package:kilo_takibi_uyg/widgets/toggle_button.dart';

class ProfileScreen extends GetView<Controller> {
  ProfileScreen({super.key});
  final SettingsController _settingsController = Get.find();
  final UserController _userController = Get.find();
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
                  const Icon(AppIcons.rocket),
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
                      "${_userController.user.value.targetWeight} ${_settingsController.weightUnit}",
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
                      _userController.user.value
                          .userName, // userController üzerinden erişim
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
    return Obx(() => Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Get.theme.indicatorColor,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Text(
                controller.records.isNotEmpty
                    ? "${controller.records.last.weight} ${_settingsController.weightUnit}"
                    : "empty".tr,
                style: Get.theme.textTheme.labelSmall,
              ),
            ),
            GestureDetector(
              onTap: () => BottomSheetHelper.showCustomBottomSheet(
                color: Get.theme.canvasColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Choose an avatar".tr,
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: Get.size.height * 0.6,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Her satırda 3 sütun
                          crossAxisSpacing: 1, // Sütunlar arası boşluk
                          mainAxisSpacing: 1, // Satırlar arası boşluk
                        ),
                        itemCount: _userController.avatarList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _userController
                                  .setAvatar(_userController.avatarList[index]);
                              Get.back();
                              print(_userController.avatarList[index]);
                            },
                            child: SvgPicture.asset(
                              _userController
                                  .avatarList[index], // Avatarın SVG yolu
                              fit: BoxFit
                                  .cover, // Resmi kapsayacak şekilde ayarlıyoruz
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              child: _userController.user.value.userAvatar == null
                  ? Image(
                      image:
                          const AssetImage("assets/images/profile/female.png"),
                      fit: BoxFit.scaleDown,
                      height: Get.size.height * 0.2,
                      alignment: Alignment.center,
                    )
                  : SvgPicture.asset(
                      _userController.user.value.userAvatar!,
                      fit: BoxFit.scaleDown,
                      height: Get.size.height * 0.25,
                      alignment: Alignment.center,
                    ),
            ),
          ],
        ));
  }
}
