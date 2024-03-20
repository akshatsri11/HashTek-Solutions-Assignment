import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hashtek_solutions/widgets/nav_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const CustomBottomNav(
      {super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      child: BottomAppBar(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(31, 30, 30, 1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey.shade800)),
          height: size.height * .075,
          child: Row(
            children: [
              navItem(
                'home',
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                'calendar',
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              Gap(size.width * .2),
              navItem(
                'bookmark',
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              navItem(
                'profile',
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
