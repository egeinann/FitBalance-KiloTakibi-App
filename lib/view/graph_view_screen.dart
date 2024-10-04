import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/bar_graph.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/line_graph.dart';
import 'package:lottie/lottie.dart';

class GraphViewScreen extends StatefulWidget {
  const GraphViewScreen({super.key});

  @override
  State<GraphViewScreen> createState() => _GraphViewScreenState();
}

class _GraphViewScreenState extends State<GraphViewScreen> {
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: context.paddingLow,
          child: Obx(() {
            // Öncelikle ödeme durumunu kontrol edelim
            if (!_controller.hasPaid.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Image(
                            image: AssetImage(
                                "assets/images/homeScreen/payment.png"),
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/lottie/recordScreenAnimated.json',
                                  fit: BoxFit.scaleDown,
                                ),
                                const AutoSizeText(
                                  "89.90",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "outfit",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
                              "You must pay to see graphs and track your progress in more detail.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomFloatingActionButton(
                                    widget: const AutoSizeText(
                                      "Payment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "outfit",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomFloatingActionButton(
                                    widget: const AutoSizeText(
                                      "Developer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "outfit",
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

            // Ödeme yapılmışsa kayıt sayısını kontrol edelim
            if (_controller.records.length >= 7) {
              return PageView(
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  _controller.onPageChanged(index);
                },
                children: [
                  lineGraph(context),
                  barGraph(context),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.05),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        image: AssetImage(
                            "assets/images/homeScreen/null_graphs.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: Get.size.height * 0.05),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "After 1 week of analysis, the graphs appear!",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
