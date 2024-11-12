import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final SettingsController _settingsController = Get.find();
  final TextEditingController _textFieldController = TextEditingController();
  String? _message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Ionicons.close),
        ),
        actions: [
          Obx(
            () {
              return Visibility(
                visible: _settingsController.hasPaid.value,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: context.paddingLarge,
        child: Obx(
          () {
            if (!_settingsController.hasPaid.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image:
                            AssetImage("assets/images/mainScreen/payment.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            child: AutoSizeText(
                              "You should upgrade to premium to embark on a healthy journey with the artificial intelligence model.",
                              textAlign: TextAlign.center,
                              style: Get.theme.textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.size.width * 0.2,
                                  ),
                                  child: customFloatingActionButton(
                                    widget: AutoSizeText(
                                      "Upgrade premium",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      _settingsController.completePayment();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.purple,
                    child: const Center(
                      child: Text("Gemini AI"),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomTextField(
                          controller: _textFieldController,
                          labelText: "Enter message",
                          onChanged: (value) {
                            _message = value;
                          },
                          maxLength: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: customFloatingActionButton(
                          widget: const Icon(Ionicons.send),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
