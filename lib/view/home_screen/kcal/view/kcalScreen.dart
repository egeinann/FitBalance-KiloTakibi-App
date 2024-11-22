import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            titleText(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectGender(),
                  const SizedBox(height: 5),
                  const CustomDivider(),
                  const SizedBox(height: 5),
                  selectActivityLevel(),
                  const SizedBox(height: 5),
                  const CustomDivider(),
                  const SizedBox(height: 5),
                  selectGoal()
                ],
              ),
            ),
            calculatedCalories(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: saveButton(),
    );
  }

  // *** TITLE ***
  AutoSizeText titleText() {
    return AutoSizeText(
      "Average daily calorie intake according to your physical life",
      textAlign: TextAlign.center,
      style: Get.theme.textTheme.labelSmall,
    );
  }

  // *** KCAL ***
  Obx calculatedCalories() {
    return Obx(
      () => Text(
        NumberFormat('#,###').format(controller.dailyCalories.value),
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.labelSmall,
      ),
    );
  }

  // *** SAVE BUTTON ***
  Padding saveButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 5),
      child: customFloatingActionButton(
        heroTag: "kcal",
        widget: const Icon(Icons.done),
        onPressed: controller.saveData,
      ),
    );
  }

  // *** GOAL ***
  Column selectGoal() {
    return Column(
      children: [
        ListTile(
          title: const Text("Regular Weight Gain"),
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
          title: const Text("Maintain Weight"),
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
          title: const Text("Regular Weight Loss"),
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
          title: const Text("Rapid Weight Loss"),
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
            // Get the current selected activity level
            final activityLevel = controller.activityLevel.value;

            // Determine the text to display based on the selected level
            String selectedLevelText;
            switch (activityLevel) {
              case ActivityLevel.Sedentary:
                selectedLevelText = "Sedentary";
                break;
              case ActivityLevel.Light:
                selectedLevelText = "Light Activity";
                break;
              case ActivityLevel.Moderate:
                selectedLevelText = "Moderate Activity";
                break;
              case ActivityLevel.Intense:
                selectedLevelText = "Intense Activity";
                break;
              case ActivityLevel.VeryIntense:
                selectedLevelText = "Very Intense Activity";
                break;
              default:
                selectedLevelText = "Not Selected";
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
                  Icons.hotel,
                  size: 40,
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
                  Icons.directions_walk,
                  size: 40,
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
                  Icons.directions_run,
                  size: 40,
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
                  Icons.fitness_center,
                  size: 40,
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
                  Icons.flash_on,
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
                  Icons.male,
                  size: 80,
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
                  Icons.female,
                  size: 80,
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
            controller.gender.value == Gender.Male ? "male" : "female",
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
