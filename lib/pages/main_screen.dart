import 'package:flutter/material.dart';
import 'package:hashtek_solutions/models/bottom_nav_model.dart';
import 'package:hashtek_solutions/models/country_model.dart';
import 'package:hashtek_solutions/pages/bottom_nav.dart';
import 'package:hashtek_solutions/pages/profile/profile_page.dart';
import 'package:hashtek_solutions/widgets/tab_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final calenderNavKey = GlobalKey<NavigatorState>();
  final bookmarkNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<CustomBottomNavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      CustomBottomNavModel(
          page: const TabPage(tab: 'Home'), navKey: homeNavKey),
      CustomBottomNavModel(
          page: const TabPage(tab: 'Calendar'), navKey: calenderNavKey),
      CustomBottomNavModel(
          page: const TabPage(tab: 'Bookmark'), navKey: bookmarkNavKey),
      CustomBottomNavModel(
          page: ProfilePage(selectedCountry: Country('USA', 'usa')),
          navKey: profileNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: size.height * .055),
          height: 65,
          width: 65,
          child: FloatingActionButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 5, color: Colors.black),
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Colors.white,
            elevation: 0,
            child: Image.asset('assets/facial-scan.png'),
          ),
        ),
        bottomNavigationBar: CustomBottomNav(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
