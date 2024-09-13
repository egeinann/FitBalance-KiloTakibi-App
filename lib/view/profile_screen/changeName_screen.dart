import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({super.key});

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _onboardingController.nameController.text.isEmpty ? false : true,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (_onboardingController.nameController.text.isEmpty) {
                Get.snackbar(
                  "",
                  "Please enter your name",
                  snackStyle: SnackStyle.FLOATING,
                  snackPosition: SnackPosition.TOP,
                  duration: const Duration(seconds: 2),
                );
              } else {
                Get.back();
              }
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
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'\s')), // Boşluk karakterlerini engeller
                        ],
                        maxLength: 12,
                        controller: _onboardingController.nameController,
                        decoration: InputDecoration(
                          counterText: "",
                          labelText: 'Your name',
                          labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).cardColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          prefixIcon: Icon(
                            Ionicons.person,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        cursorColor: Theme.of(context).focusColor,
                        style: Theme.of(context).textTheme.titleLarge,
                        onChanged: (value) {
                          _onboardingController.setUserName(value);
                        },
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
          child: FloatingActionButton(
            heroTag: "a",
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            splashColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 20,
            onPressed: () {
              if (_onboardingController.nameController.text.isEmpty) {
                Get.snackbar(
                  "",
                  "Please enter your name",
                  snackStyle: SnackStyle.FLOATING,
                  snackPosition: SnackPosition.TOP,
                  duration: const Duration(seconds: 2),
                );
              } else {
                _onboardingController.userName;
                Get.focusScope?.unfocus();
                Get.back();
                Get.snackbar("${_onboardingController.userName}",
                    "You changed your name");
              }
            },
            child: const Icon(Icons.done),
          ),
        ),
      ),
    );
  }
}
