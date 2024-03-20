import 'package:flutter/material.dart';

Widget navItem(String icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Image.asset(
        selected ? 'assets/${icon}_filled.png' : 'assets/$icon.png',
        scale: 1.2,
      ),
    ),
  );
}
