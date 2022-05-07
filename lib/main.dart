import 'package:flutter/material.dart';

import 'landingPage/landing_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehicle Rental App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        //scaffoldBackgroundColor: kBackgroundColor,
        // primaryColor: kPrimaryColor,
        // textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingScreen(),
      // home: MainScreen(),
    );
  }
}
