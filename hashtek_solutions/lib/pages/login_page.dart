import 'package:flutter/material.dart';
import 'package:hashtek_solutions/models/country_model.dart';
import 'package:hashtek_solutions/pages/profile/profile_page.dart';
import 'package:hashtek_solutions/widgets/log_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: LogButton(
              size: size,
              text: 'in',
              widget: ProfilePage(selectedCountry: Country('USA', 'usa')))),
    );
  }
}
