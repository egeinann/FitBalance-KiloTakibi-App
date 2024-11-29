import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/number_picker_weight.dart';

class ChangeTargetWeightScreen extends GetView<Controller> {
  final SettingsController _settingsController = Get.find();
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => NumberPickerWeight(
                            isKgSelected: _settingsController.isKgSelected,
                            value: controller.temporaryTargetWeight.value,
                            onChanged: (value) {
                              controller.temporaryTargetWeight.value = value;
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          _settingsController.weightUnit,
                          style: Get.theme.textTheme.labelSmall,
                        ),
                      ],
                    )
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
            // "Done" düğmesine basıldığında geçici hedef ağırlığı kaydet
            controller.setTargetWeight(controller.temporaryTargetWeight.value);
            Get.back();
            SnackbarHelper.showSnackbar(
              title: "Your target weight has been updated".tr,
              message: "Good luck".tr,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              icon: const Icon(AppIcons.flag),
            );
          },
        ),
      ),
    );
  }
}
