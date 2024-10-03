import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/view/bmi_screen.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/model/info_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/changeName_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/changeTargetWeight_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLarge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              genderImage(context),
              SizedBox(height: Get.size.height * 0.02),
              nameContainer(context),
              SizedBox(height: Get.size.height * 0.02),
              targetWeightContainer(context),
              SizedBox(height: Get.size.height * 0.05),
              floatingButtons(context),
              SizedBox(height: Get.size.height * 0.1)
            ],
          ),
        ),
      ),
    );
  }

  // *** FLOATING BUTTONS ***
  Widget floatingButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            AutoSizeText("Weight balance",
                style: Theme.of(context).textTheme.bodySmall),
            Padding(
              padding: context.paddingLow,
              child: CustomFloatingActionButton(
                heroTag: "profile",
                widget: const Icon(Ionicons.pulse),
                onPressed: () {
                  Get.to(InfoScreen(), transition: Transition.fadeIn);
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            AutoSizeText("Calculate BMI",
                style: Theme.of(context).textTheme.bodySmall),
            Padding(
              padding: context.paddingLow,
              child: CustomFloatingActionButton(
                heroTag: "bmi",
                widget: const Icon(Ionicons.accessibility),
                onPressed: () {
                  Get.to(BmiScreen(), transition: Transition.fadeIn);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // *** GENDER TOP IMAGE ***
  Column genderImage(BuildContext context) {
    return Column(
      children: [
        // Resmi gösteren kısım
        Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300), // Animasyon süresi
            child: Image(
              key: ValueKey<bool>(_controller.selectedGenderRange[
                  0]), // Animasyonu tetiklemek için bir anahtar
            image: AssetImage(
              _controller.selectedGenderRange[0]
                  ? "assets/images/profile/male.png"
                  : "assets/images/profile/female.png",
            ),
            fit: BoxFit.scaleDown,
              height: Get.size.height * 0.2,
          ),
        ),
        ),
        Obx(
          () => ToggleButtons(
            renderBorder: false,
            fillColor: Colors.transparent,
            splashColor: Colors.transparent,
            isSelected: _controller.selectedGenderRange,
            onPressed: (int index) {
              _controller.updateGenderRange(index);
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _controller.selectedGenderRange[0]
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).canvasColor,
                  ),
                  child: Text(
                    "Male",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _controller.selectedGenderRange[1]
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).canvasColor,
                  ),
                  child: Text(
                    "Female",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // *** NAME CONTAINER ***
  Container nameContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          Get.to(ChangeNameScreen(),
              transition: Transition.rightToLeftWithFade);
        },
        child: Padding(
          padding: context.paddingLarge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child:
                    Text("NAME", style: Theme.of(context).textTheme.bodySmall),
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${_onboardingController.userName}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(width: Get.size.width * 0.03),
                  const Icon(Ionicons.chevron_forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** TARGETWEIGHT CONTAINER ***
  Container targetWeightContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          Get.to(ChangeTargetWeightScreen(),
              transition: Transition.rightToLeftWithFade);
        },
        child: Padding(
          padding: context.paddingLarge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Text("TARGET WEIGHT",
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "${_onboardingController.targetWeight.value}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(width: Get.size.width * 0.03),
                  const Icon(Ionicons.chevron_forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
