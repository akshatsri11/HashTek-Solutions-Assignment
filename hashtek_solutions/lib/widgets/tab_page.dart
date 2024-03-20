import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final String tab;
  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page $tab"),
        ),
        body: Center(
          child: Text("$tab Page"),
        ));
  }
}
