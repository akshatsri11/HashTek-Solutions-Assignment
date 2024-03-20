import 'package:flutter/material.dart';
import 'package:hashtek_solutions/models/country_model.dart';
import 'package:hashtek_solutions/pages/profile/profile_page.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  int _selectedOption = 0;

  List<Country> countries = Country.getCountries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    selectedCountry: countries[_selectedOption],
                  ),
                ),
              );
            },
            icon: Container(
                alignment: Alignment.center,
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade800)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ))),
        title: const Text('Country Selection'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Row(
              children: [
                Image.asset(
                  'assets/${countries[index].flag}.png',
                  scale: 23,
                ),
                Text('  ${countries[index].name}'),
              ],
            ),
            activeColor: Colors.white,
            value: index,
            groupValue: _selectedOption,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (int? value) {
              setState(() {
                _selectedOption = value ?? 0;
              });
            },
          );
        },
      ),
    );
  }
}
