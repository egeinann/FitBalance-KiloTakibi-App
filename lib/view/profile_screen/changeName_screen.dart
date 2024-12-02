import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class ChangeNameScreen extends GetView<Controller> {
  ChangeNameScreen({super.key});
  final UserController _userController = Get.find();
  final SettingsController _settingsController = Get.find();

  // Temporary değer
  RxString temporaryUserName = "".obs;

  @override
  Widget build(BuildContext context) {
    // Geçici değeri, gerçek değerden başlatıyoruz
    temporaryUserName.value = _userController.user.value.userName;

    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(AppIcons.arrowBack),
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
                          text: temporaryUserName
                              .value), // Geçici değeri kullanıyoruz
                      labelText: "Your name".tr,
                      onChanged: (value) {
                        // TextField'dan gelen değeri geçici değişkende güncelliyoruz
                        temporaryUserName.value = value;
                      },
                      titleIcon: Icon(
                        AppIcons.person,
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
        padding: const EdgeInsets.only(bottom: 30, right: 5),
        child: customFloatingActionButton(
          heroTag: "profile",
          widget: const Icon(AppIcons.done),
          onPressed: () {
            changeNameSave();
          },
        ),
      ),
    );
  }

  // *** SAVE BUTONU İLE YAPILAN DEĞİŞİKLİĞİ KAYDETME ***
  void changeNameSave() {
    if (temporaryUserName.value.isEmpty) {
      SnackbarHelper.showSnackbar(
        title: "Name ?".tr,
        message: "Please enter your name".tr,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(AppIcons.alert),
      );
    } else {
      // Temporary değeri gerçek değere aktarıyoruz
      _userController.setUserName(temporaryUserName.value);

      // Focus'u kaybetme ve geri gitme işlemi
      Get.focusScope?.unfocus();
      Get.back();

      // Snackbar ile başarı mesajı gösterme
      SnackbarHelper.showSnackbar(
        title: "You changed your name".tr,
        message: temporaryUserName.value, // Yeni kullanıcı adı
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(AppIcons.person),
      );
    }
  }
}
