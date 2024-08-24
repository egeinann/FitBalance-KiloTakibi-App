import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/navigation_bar.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Geri gitme işlemini engelle
      child: Scaffold(
        body: Obx(() {
          return indexedStack(); // IndexedStack, gözlemlenen değişkeni içerir
        }),
        bottomNavigationBar: Obx(() {
          return bottomNavigationBar(context); // CustomBottomNavigationBar, gözlemlenen değişkeni içerir
        }),
      ),
    );
  }
}
