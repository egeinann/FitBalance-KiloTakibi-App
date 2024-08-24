import 'package:flutter/material.dart';
// *** uygulamada kullanılacak button ***
Widget appButton(VoidCallback onPressed, Widget widget) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 15,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: widget,
    ),
  );
}
/*

import 'package:flutter/material.dart';
// *** uygulamada kullanılacak button ***
Widget appButton(VoidCallback onPressed, Widget widget) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 15,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: widget,
    ),
  );
}


*/