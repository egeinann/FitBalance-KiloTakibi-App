import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/controllers/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class ChangeNameScreen extends GetView<Controller> {
  ChangeNameScreen({super.key});

  final SettingsController _settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.temporaryUserName.value = controller.userName.value;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Ionicons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Name".tr,
          style: Get.theme.textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Obx(
                  () => Image(
                    image: AssetImage(
                      _settingsController.isMale
                              .value // Cinsiyet durumu burada kontrol ediliyor
                          ? "assets/images/name/name_male.png"
                          : "assets/images/name/name_female.png",
                    ),
                    fit: BoxFit.scaleDown,
                    height: Get.size.height * 0.2,
                  ),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: TextEditingController(
                          text: controller.temporaryUserName
                              .value), // TextEditingController'ı burada kullanıyoruz
                      labelText: "Your name".tr,
                      onChanged: (value) {
                        // nameController'dan gelen değeri güncelliyoruz
                        controller.temporaryUserName.value = value;
                      },
                      titleIcon: Icon(
                        Ionicons.person,
                        color: Colors.grey.shade700,
                      ),
                      maxLength: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: context.paddingLarge,
        child: CustomFloatingActionButton(
          heroTag: "profile",
          widget: const Icon(Icons.done),
          onPressed: () {
            changeNameSave();
          },
        ),
      ),
    );
  }

  // *** NEW NICKNAME BUTTON SAVE ***
  void changeNameSave() {
    if (controller.temporaryUserName.value.isEmpty) {
      SnackbarHelper.showSnackbar(
        title: "Name ?".tr,
        message: "Please enter your name".tr,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Ionicons.cloud_offline),
      );
    } else {
      controller.setUserName(controller.temporaryUserName.value);
      Get.focusScope?.unfocus();
      Get.back();
      SnackbarHelper.showSnackbar(
        title: "You changed your name".tr,
        message: "${controller.userName}",
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Ionicons.person),
      );
    }
  }
}
