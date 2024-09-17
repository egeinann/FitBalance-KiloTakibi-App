import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/settings_screen.dart';
import 'package:kilo_takibi_uyg/widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.put(Controller());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            _controller.appBarTitle.value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => Visibility(
              visible: _controller.currentTabIndex.value == 4,
              child: IconButton(
                onPressed: () {
                  Get.to(
                    const SettingsScreen(),
                    transition: Transition.downToUp,
                  );
                },
                icon: const Icon(Ionicons.settings),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context)
                    .scaffoldBackgroundColor, // Temadan alınan renk
                Color.fromARGB(255, 27, 130, 208), // Benzer bir ton
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: indexedStack(), // IndexedStack, gözlemlenen değişkeni içerir
        );
      }),
      bottomNavigationBar: Obx(() {
        return bottomNavigationBar(
            context); // CustomBottomNavigationBar, gözlemlenen değişkeni içerir
      }),
    );
  }
}
