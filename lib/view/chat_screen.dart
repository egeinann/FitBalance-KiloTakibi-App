import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/textField.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final Controller _controller = Get.find();
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
                visible: _controller.hasPaid.value,
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
            if (!_controller.hasPaid.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image:
                            AssetImage("assets/images/homeScreen/payment.png"),
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
                              "You should upgrade to premium to embark on a healthy journey with the artificial intelligence model."
                                  .tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
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
                                  child: CustomFloatingActionButton(
                                    widget: AutoSizeText(
                                      "Upgrade premium".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      _controller.completePayment();
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
                    color: Colors.red,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          Text("data"),
                          SizedBox(height: 700),
                          Text("data"),
                        ],
                      ),
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
                        child: CustomFloatingActionButton(
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
