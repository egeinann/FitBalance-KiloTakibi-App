import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/onboarding/controller/onboarding_controller.dart';
import 'package:kilo_takibi_uyg/widgets/decimal_number_picker.dart';

class ChangeTargetWeightScreen extends StatelessWidget {
  ChangeTargetWeightScreen({super.key});

  final OnboardingController _onboardingController = Get.find();
  
  // Geçici hedef ağırlık değişkeni
  final RxDouble _temporaryTargetWeight = RxDouble(0.0);
  // done'ye basılmadan değişiklik olmayacak
  @override
  Widget build(BuildContext context) {
    // Ekran açıldığında geçici hedef ağırlığı mevcut değere ayarlayın
    _temporaryTargetWeight.value = _onboardingController.targetWeight.value;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Target Weight",
          style: Theme.of(context).textTheme.titleLarge,
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
                  'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardColor,
                      ),
                      width: Get.size.width * 0.5,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Obx(
                            () => Numbers(
                              value: _temporaryTargetWeight.value,
                              onChanged: (value) {
                                _temporaryTargetWeight.value = value;
                              },
                            ),
                          ),
                          const Icon(
                            Icons.arrow_left_rounded,
                            size: 30,
                          ),
                        ],
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
            _onboardingController.setTargetWeight(_temporaryTargetWeight.value);
            Get.back();
            SnackbarHelper.showSnackbar(
              title: "Your target weight has been updated",
              message: "Good luck",
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
