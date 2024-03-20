import 'package:flutter/material.dart';
import 'package:hashtek_solutions/pages/login_page.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    super.key,
    required this.size,
    required this.text,
    required this.widget,
  });

  final Size size;
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.all(size.width * .05),
        height: size.height * .065,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * .1),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/log_out.png',
              color: Colors.white,
            ),
            Text(
              '  Log $text',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * .04),
            ),
          ],
        ),
      ),
    );
  }
}
