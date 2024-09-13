import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/bar_graph.dart';
import 'package:kilo_takibi_uyg/widgets/line_graph.dart';

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
        child: Obx(() => _controller.records.length >= 7
            ? PageView(
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  _controller.onPageChanged(index);
                },
                children: [
                  lineGraph(context),
                  barGraph(context),
                ],
              )
            : Center(
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
                            "After 1 week of analysis, the graphs appear !",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
