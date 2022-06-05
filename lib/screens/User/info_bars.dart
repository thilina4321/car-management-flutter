import 'package:ds_rent_cars/landingPage/landing_screen.dart';
import 'package:ds_rent_cars/landingPage/login_screen.dart';
import 'package:flutter/material.dart';

import './/components/constants.dart';

class ProfileInfoBars extends StatelessWidget {
  final Size size;
  final String title;
  final Icon iconname;

  ProfileInfoBars({
    required this.size,
    required this.title,
    required this.iconname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.8,
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding,
      ),
      padding: EdgeInsets.only(
        left: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: size.height * 0.04,
            width: size.width * 0.09,
            child: Icon(
              iconname.icon,
              size: 25,
              color: kPrimaryColor,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.grey[900],
            ),
          ),
          Spacer(),
          Container(
            height: size.height * 0.04,
            width: size.width * 0.09,
            padding: EdgeInsets.only(
              left: 1,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: kSecondaryColor,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingScreen(),
                  ),
                );
              },
            ),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}
