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
      opacity: _createAnimation(),
      child: noRecord(controller, context),
    );
  }

  // Animasyonun doğru şekilde çalışabilmesi için AnimationController'ı burada oluşturuyoruz
  Animation<double> _createAnimation() {
    final controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: _TickerProvider(),
    );

    final animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    return animation;
  }

  // Kayıt bulunamadığında gösterilen widget
  Center noRecord(Controller controller, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * 0.05), // GetX ile yükseklik alma
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/mainScreen/null_records.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: Get.height * 0.05), // GetX ile yükseklik alma
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "No record found !".tr, // Dil desteği
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium, // GetX ile tema erişimi
                ),
                const SizedBox(height: 10),
                customFloatingActionButton(
                  widget: const FittedBox(child: Icon(Ionicons.chevron_back)),
                  onPressed: () {
                    controller.goToHomeScreen(); // Ana ekrana git
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
