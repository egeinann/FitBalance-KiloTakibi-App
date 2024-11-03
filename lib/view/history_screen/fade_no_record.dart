import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';

class FadeNoRecord extends GetView<Controller> {
  const FadeNoRecord({super.key});

  @override
  Widget build(BuildContext context) {


    return FadeTransition(
      opacity: _createAnimation(context),
      child: noRecord(context, controller),
    );
  }

  Animation<double> _createAnimation(BuildContext context) {
    final controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync:
          _TickerProvider(), // Eğer bir TickerProvider gerekiyorsa, bunu yönetin
    );

    final animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    return animation;
  }

  Center noRecord(BuildContext context, Controller controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/mainScreen/null_records.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "No record found !".tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                CustomFloatingActionButton(
                  widget: const FittedBox(child: Icon(Ionicons.chevron_back)),
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      controller.goToHomeScreen();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
