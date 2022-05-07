import 'package:flutter/material.dart';

import './/components/constants.dart';

class WelcomePage extends StatelessWidget {
  final PageController pageController;

  const WelcomePage({required this.pageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            Container(
              height: size.height * 0.4,
              width: size.width * 0.87,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login screen images/welcome.png"),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Text(
                "Welcome to our Car rental app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kLScrnTxtColor2,
                ),
              ),
            ),
            SizedBox(height: size.width * 0.015),
            Text(
              "Get your favourite car on rent",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: kLScrnTxtColor2,
              ),
            ),
            SizedBox(height: size.width * 0.28),
            FlatButton(
              color: kLScrnTxtColor1,
              textColor: Colors.white,
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.linearToEaseOut,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              minWidth: size.width * 0.75,
              height: size.width * 0.125,
            ),
            //SizedBox(height: size.height * 0.08),
          ],
        ),
      ),
    );
  }
}

// Container(
//           height: size.height * 0.15,
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(
//             horizontal: size.width * 0.1,
//           ),
//           child: Text(
//             "DS Rent Cars",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 40,
//               fontWeight: FontWeight.w500,
//               color: kLScrnTxtColor2,
//             ),
//           ),
//         ),