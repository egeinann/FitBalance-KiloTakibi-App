// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final String? heroTag;
  final bool? mini;
  const CustomFloatingActionButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.heroTag,
    this.mini = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        mini: mini ?? false,
        heroTag: heroTag,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        onPressed: onPressed,
        child: widget);
  }
}
