import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/user_controller.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class IntroNameScreen extends GetView<Controller> {
  IntroNameScreen({super.key});
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode(); // FocusNode KASMA SORUNU İÇİN

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: textColorizeAnimated(
                    text: 'Enter your name'.tr,
                    textStyle: Get.theme.textTheme.titleLarge!,
                    isRepeat: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextField(
                controller: controller.nameController,
                labelText: "Your name".tr,
                focusNode: focusNode, // FocusNode kullanılıyor
                onChanged: (value) {
                  _userController.setUserName(value);
                },
                titleIcon: Icon(
                  AppIcons.person,
                  color: Colors.grey.shade700,
                ),
                maxLength: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
