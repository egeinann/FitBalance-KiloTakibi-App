import 'package:flutter/material.dart';

class SettingsModel {
  final Icon icon;
  final String text;
  final String? subText; // subText nullable olarak tanımlandı
  final Widget widget;
  final VoidCallback onTap; // Tıklama olayını yönetme

  SettingsModel(this.icon, this.text, this.subText,this.widget, {required this.onTap});
}
