import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class ChangeNameScreen extends StatelessWidget {
  ChangeNameScreen({super.key});

  final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Ionicons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Name",
          style: Theme.of(context).textTheme.titleLarge,
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
                      _controller.selectedGenderRange[0]
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
                      controller: _onboardingController.nameController,
                      labelText: "Your name",
                      onChanged: (value) {
                        _onboardingController.temporaryUserName.value = value;
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
    if (_onboardingController.temporaryUserName.value.isEmpty) {
      SnackbarHelper.showSnackbar(
        title: "Name ?",
        message: "Please enter your name",
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Ionicons.cloud_offline),
      );
    } else {
      _onboardingController
          .setUserName(_onboardingController.temporaryUserName.value);
      Get.focusScope?.unfocus();
      Get.back();
      SnackbarHelper.showSnackbar(
        title: "You changed your name",
        message: "${_onboardingController.userName}",
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Ionicons.person),
      );
    }
  }
}
