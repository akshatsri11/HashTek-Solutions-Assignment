import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hashtek_solutions/models/country_model.dart';
import 'package:hashtek_solutions/pages/login_page.dart';
import 'package:hashtek_solutions/pages/profile/country_page.dart';
import 'package:hashtek_solutions/widgets/log_button.dart';

class ProfilePage extends StatefulWidget {
  final Country selectedCountry;
  const ProfilePage({super.key, required this.selectedCountry});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> icons = [
    'profile',
    'favorite',
    'country',
    'notification',
    'settings',
    'help',
  ];
  final List<String> names = [
    'Profile',
    'Favorite',
    'Country',
    'Notification',
    'Settings',
    'Help',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: TextStyle(
              fontSize: size.width * .045, fontWeight: FontWeight.w400),
        ),
      ),
      body: Center(
        child: Column(children: [
          CircleAvatar(
            radius: size.width * .1,
            backgroundImage: NetworkImage(
                'https://www.realmenrealstyle.com/wp-content/uploads/2023/06/Vanity-Glasses.jpg'),
          ),
          Gap(size.height * .02),
          Text(
            'Michael Watson',
            style: TextStyle(fontSize: size.width * .045),
          ),
          Gap(size.height * .007),
          Text(
            '(203) 2563-8542',
            style: TextStyle(
                color: Colors.grey.shade400, fontSize: size.width * .035),
          ),
          Gap(size.height * .015),
          Container(
            height: size.height * .001,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    radius: size.height * .6,
                    colors: const [Colors.grey, Colors.black, Colors.black])),
          ),
          SizedBox(
            height: size.height * .48,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(size.width * .05) -
                    EdgeInsets.only(top: size.height * .004),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.width * .04),
                    child: ListTile(
                      minLeadingWidth: 10,
                      dense: true,
                      onTap: () {
                        index == 2
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectCountryPage(),
                                ),
                              )
                            : null;
                      },
                      leading: Image.asset(
                        'assets/${icons[index]}.png',
                        scale: 1.2,
                      ),
                      title: Text(
                        names[index],
                        style: TextStyle(fontSize: size.width * .04),
                      ),
                      trailing: SizedBox(
                        width: size.width * .4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            index == 2
                                ? Image.asset(
                                    'assets/${widget.selectedCountry.flag}.png',
                                    scale: 23,
                                  )
                                : Container(),
                            index == 2
                                ? Text(
                                    '  ${widget.selectedCountry.name}  ',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  )
                                : Container(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: size.width * .035,
                            ),
                          ],
                        ),
                      ),
                      tileColor: const Color.fromRGBO(30, 31, 30, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.width * .1)),
                    ),
                  );
                }),
          ),
          LogButton(
            size: size,
            text: 'out',
            widget: const LoginScreen(),
          )
        ]),
      ),
    );
  }
}
