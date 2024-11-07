import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/widgets/animated_text.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class IntroNameScreen extends GetView<Controller> {
  IntroNameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode(); // FocusNode KASMA SORUNU İÇİN

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  textColorizeAnimated(
                    text: 'Enter your name'.tr,
                    textStyle: Get.theme.textTheme.titleLarge!,
                    isRepeat: false,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
                    child: CustomTextField(
                      controller: controller.nameController,
                      labelText: "Your name".tr,
                      focusNode: _focusNode, // FocusNode kullanılıyor
                      onChanged: (value) {
                        controller.setUserName(value);
                      },
                      titleIcon: Icon(
                        Ionicons.person,
                        color: Colors.grey.shade700,
                      ),
                      maxLength: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
