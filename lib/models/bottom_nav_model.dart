import 'package:flutter/material.dart';

class CustomBottomNavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  CustomBottomNavModel({required this.page, required this.navKey});
}
