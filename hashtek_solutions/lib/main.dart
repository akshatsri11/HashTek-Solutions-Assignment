import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hashtek_solutions/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.hippieBlue,
          darkIsTrueBlack: true,
        ),
        themeMode: ThemeMode.dark,
        home: const MainScreen());
  }
}
