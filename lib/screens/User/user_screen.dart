import 'package:flutter/material.dart';

import 'user_body.dart';
import './/components/constants.dart';
import './/screens/MainScreen/main_screen.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: size.height * 0.11,
        backgroundColor: Colors.transparent,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey[900],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.isFirst,
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: UserBody(),
    );
  }
}
