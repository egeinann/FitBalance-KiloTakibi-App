import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/view/home_screen/home_screen.dart';
import 'package:kilo_takibi_uyg/view/gallery_screen/gallery_screen.dart';
import 'package:kilo_takibi_uyg/view/graph_view_screen.dart';
import 'package:kilo_takibi_uyg/view/history_screen/history_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/profile_screen.dart';

final Controller _controller = Get.put(Controller());

/// Animasyonlu IndexedStack
IndexedStack indexedStack() {
  return IndexedStack(
    index: _controller.currentTabIndex.value,
    children: [
      GraphViewScreen(),
      GalleryScreen(records: _controller.records),
      HomeScreen(),
      HistoryScreen(),
      ProfileScreen(),
    ],
  );
}

/// Bottom Navigation Bar
Widget bottomNavigationBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 30,
      left: 25,
      right: 25,
    ),
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(-1, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.images),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.layers),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person),
              label: "",
            ),
          ],
          currentIndex: _controller.currentTabIndex.value,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).indicatorColor,
          onTap: (index) {
            Get.focusScope?.unfocus();
            _controller.changeTabIndex(index);
          },
        ),
      ),
    ),
  );
}
