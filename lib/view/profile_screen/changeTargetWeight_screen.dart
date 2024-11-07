import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';

class ChangeTargetWeightScreen extends GetView<Controller> {
  ChangeTargetWeightScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller.temporaryTargetWeight.value = controller.targetWeight.value;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "Target Weight".tr,
          style: Get.theme.textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage("assets/images/targetWeight/target.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: context.paddingLarge,
                child: AutoSizeText(
                  'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.'
                      .tr,
                  style: Get.theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Numbers(
                        value: controller.temporaryTargetWeight.value,
                        onChanged: (value) {
                          controller.temporaryTargetWeight.value = value;
                        },
                      ),
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
            // "Done" düğmesine basıldığında geçici hedef ağırlığı kaydet
            controller.setTargetWeight(controller.temporaryTargetWeight.value);
            Get.back();
            SnackbarHelper.showSnackbar(
              title: "Your target weight has been updated".tr,
              message: "Good luck".tr,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              icon: const Icon(Ionicons.golf),
            );
          },
        ),
      ),
    );
  }
}
