// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// turuncu button
Widget customFloatingActionButton({
  required Widget widget,
  required VoidCallback onPressed,
  String? heroTag,
  bool mini = false,
  Color? backgroundColor,
}) {
  return FloatingActionButton(
    mini: mini,
    heroTag: heroTag,
    backgroundColor: backgroundColor ?? Get.theme.primaryColor,
    foregroundColor: Get.theme.scaffoldBackgroundColor,
    splashColor: Colors.white,
    elevation: 10,
    onPressed: onPressed,
    child: widget,
  );
}

// sarı button
Widget customFloatingActionButtonYellow({
  required Widget widget,
  required VoidCallback onPressed,
  String? heroTag,
  bool mini = false,
  Color? backgroundColor,
}) {
  return FloatingActionButton(
    mini: mini,
    heroTag: heroTag,
    backgroundColor: backgroundColor ?? Get.theme.focusColor,
    foregroundColor: Get.theme.scaffoldBackgroundColor,
    splashColor: Colors.white,
    elevation: 10,
    onPressed: onPressed,
    child: widget,
  );
}
