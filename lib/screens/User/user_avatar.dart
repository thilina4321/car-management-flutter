import 'package:flutter/material.dart';

import './/components/constants.dart';

class UserAvatar extends StatelessWidget {
  final Size size;
  final String image;

  UserAvatar({
    required this.size,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.45,
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: kPrimaryColor,
        child: CircleAvatar(
          radius: 72,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
      // child: CircleAvatar(
      //   backgroundImage: AssetImage("assets/icons/account.png"),
      // ),
    );
  }
}
