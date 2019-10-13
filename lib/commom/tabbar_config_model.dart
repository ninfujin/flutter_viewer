import 'package:flutter/material.dart';


class TabConfigModel {
  final String title;
  final Color titleColor;
  final Color unselectedTitleColor;
  final IconData icon;
  TabConfigModel({
    this.title,
    this.icon,
    this.titleColor = Colors.white,
    this.unselectedTitleColor = Colors.grey});
}