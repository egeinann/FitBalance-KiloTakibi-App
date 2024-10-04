import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/view/add_screen.dart';
import 'package:kilo_takibi_uyg/view/gallery_screen/gallery_screen.dart';
import 'package:kilo_takibi_uyg/view/graph_view_screen.dart';
import 'package:kilo_takibi_uyg/view/history_screen/history_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/profile_screen.dart';

final Controller _controller = Get.find();

// *** BOTTOM BAR ICIN INDEXLI SAYFALAR ***
IndexedStack indexedStack() {
  return IndexedStack(
    index: _controller.currentTabIndex.value,
    children: [
      const GraphViewScreen(),
      GalleryScreen(records: _controller.records),
      const AddScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ],
  );
}

// *** BOTTOM BAR ***
Widget bottomNavigationBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 30,
      left: 25,
      right: 25,
    ),
    child: Container(
      height: 80, // Yükseklik ayarı yapılmış
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(-1, 1), // Gölgenin konumu
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(-1, 1), // Gölgenin konumu
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
              icon: Icon(Ionicons.image),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
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

/*
CurvedNavigationBar curvedNavigationbar(BuildContext context) {
  return CurvedNavigationBar(
    maxWidth: Get.size.width,
    backgroundColor: Colors.transparent,
    animationDuration: const Duration(milliseconds: 200),
    color: Theme.of(context).focusColor,
    onTap: (index) {
      _controller.changeTabIndex(index);
      FocusScope.of(context).unfocus();
    },
    index: _controller.currentTabIndex.value,
    items: const [
      Icon(Icons.show_chart, color: Colors.white),
      Icon(Ionicons.image, color: Colors.white),
      Icon(Icons.add, color: Colors.white),
      Icon(Ionicons.layers, color: Colors.white),
      Icon(Ionicons.settings, color: Colors.white),
    ],
  );
}
*/