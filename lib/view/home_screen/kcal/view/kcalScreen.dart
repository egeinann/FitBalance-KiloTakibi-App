import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/constants/app_icons.dart';
import 'package:kilo_takibi_uyg/controllers/kcal_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/home_screen/kcal/model/kcal_model.dart';
import 'package:kilo_takibi_uyg/widgets/divider.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';

class KcalScreen extends GetView<KcalController> {
  const KcalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Daily calories".tr,
          style: Get.theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              selectGender(),
              const SizedBox(height: 5),
              const CustomDivider(),
              const SizedBox(height: 5),
              selectActivityLevel(),
              const SizedBox(height: 5),
              const CustomDivider(),
              const SizedBox(height: 5),
              selectGoal(),
              const SizedBox(height: 5),
              calculatedCalories(),
            ],
          ),
        ),
      ),
      floatingActionButton: saveButton(),
    );
  }

  // *** KCAL ***
  Widget calculatedCalories() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.canvasColor.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              NumberFormat('#,###').format(controller.dailyCalories.value),
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.labelSmall,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            "kcal".tr,
            style: Get.theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // *** SAVE BUTTON ***
  Padding saveButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 5),
      child: customFloatingActionButton(
        heroTag: "kcal",
        widget: const Icon(AppIcons.done),
        onPressed: controller.saveData,
      ),
    );
  }

  // *** GOAL ***
  Column selectGoal() {
    return Column(
      children: [
        ListTile(
          title: Text("Regular Weight Gain".tr),
          titleTextStyle: Get.theme.textTheme.bodyMedium,
          leading: Obx(
            () => Radio<Goal>(
              value: Goal.RegularWeightGain,
              groupValue: controller.goal.value,
              onChanged: (Goal? value) {
                if (value != null) {
                  controller.updateGoal(value);
                }
              },
              activeColor: Colors.orange,
            ),
          ),
          onTap: () {
            controller.updateGoal(Goal.RegularWeightGain);
          },
        ),
        ListTile(
          title: Text("Maintain Weight".tr),
          titleTextStyle: Get.theme.textTheme.bodyMedium,
          leading: Obx(
            () => Radio<Goal>(
              value: Goal.MaintainWeight,
              groupValue: controller.goal.value,
              onChanged: (Goal? value) {
                if (value != null) {
                  controller.updateGoal(value);
                }
              },
              activeColor: Colors.green,
            ),
          ),
          onTap: () {
            controller.updateGoal(Goal.MaintainWeight);
          },
        ),
        ListTile(
          title: Text("Regular Weight Loss".tr),
          titleTextStyle: Get.theme.textTheme.bodyMedium,
          leading: Obx(
            () => Radio<Goal>(
              value: Goal.RegularWeightLoss,
              groupValue: controller.goal.value,
              onChanged: (Goal? value) {
                if (value != null) {
                  controller.updateGoal(value);
                }
              },
              activeColor: Colors.blue,
            ),
          ),
          onTap: () {
            controller.updateGoal(Goal.RegularWeightLoss);
          },
        ),
        ListTile(
          title: Text("Rapid Weight Loss".tr),
          titleTextStyle: Get.theme.textTheme.bodyMedium,
          leading: Obx(
            () => Radio<Goal>(
              value: Goal.RapidWeightLoss,
              groupValue: controller.goal.value,
              onChanged: (Goal? value) {
                if (value != null) {
                  controller.updateGoal(value);
                }
              },
              activeColor: Colors.red,
            ),
          ),
          onTap: () {
            controller.updateGoal(Goal.RapidWeightLoss);
          },
        ),
      ],
    );
  }

  // *** ACTIVITY ***
  Column selectActivityLevel() {
    return Column(
      children: [
        Obx(
          () {
            String selectedLevelText;
            switch (controller.activityLevel.value) {
              case ActivityLevel.Sedentary:
                selectedLevelText = "Sedentary".tr;
                break;
              case ActivityLevel.Light:
                selectedLevelText = "Light Activity".tr;
                break;
              case ActivityLevel.Moderate:
                selectedLevelText = "Moderate Activity".tr;
                break;
              case ActivityLevel.Intense:
                selectedLevelText = "Intense Activity".tr;
                break;
              case ActivityLevel.VeryIntense:
                selectedLevelText = "Very Intense Activity".tr;
                break;
              default:
                selectedLevelText = "Not Selected".tr;
            }

            // Display the selected text
            return Text(
              selectedLevelText,
              style: Get.theme.textTheme.bodyLarge,
            );
          },
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () =>
                  controller.updateActivityLevel(ActivityLevel.Sedentary),
              child: Obx(
                () => Icon(
                  AppIcons.bed,
                  size: 50,
                  color:
                      controller.activityLevel.value == ActivityLevel.Sedentary
                          ? Colors.blue
                          : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => controller.updateActivityLevel(ActivityLevel.Light),
              child: Obx(
                () => Icon(
                  AppIcons.walk,
                  size: 50,
                  color: controller.activityLevel.value == ActivityLevel.Light
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  controller.updateActivityLevel(ActivityLevel.Moderate),
              child: Obx(
                () => Icon(
                  AppIcons.run,
                  size: 50,
                  color:
                      controller.activityLevel.value == ActivityLevel.Moderate
                          ? Colors.orange
                          : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  controller.updateActivityLevel(ActivityLevel.Intense),
              child: Obx(
                () => Icon(
                  AppIcons.barbell,
                  size: 50,
                  color: controller.activityLevel.value == ActivityLevel.Intense
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  controller.updateActivityLevel(ActivityLevel.VeryIntense),
              child: Obx(
                () => Icon(
                  AppIcons.flash,
                  size: 40,
                  color: controller.activityLevel.value ==
                          ActivityLevel.VeryIntense
                      ? Colors.purple
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // *** GENDER ***
  Column selectGender() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => controller.updateGender(Gender.Male),
              child: Obx(
                () => Icon(
                  AppIcons.man,
                  size: 60,
                  color: controller.gender.value == Gender.Male
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => controller.updateGender(Gender.Female),
              child: Obx(
                () => Icon(
                  AppIcons.woman,
                  size: 60,
                  color: controller.gender.value == Gender.Female
                      ? Colors.pink
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Obx(
          () => Text(
            controller.gender.value == Gender.Male ? "male".tr : "female".tr,
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
