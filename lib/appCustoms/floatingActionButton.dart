// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final String? heroTag;
  const CustomFloatingActionButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 20,
        onPressed: onPressed,
        child: widget);
  }
}
