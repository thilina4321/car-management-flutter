import 'package:animations/animations.dart';

import 'package:flutter/material.dart';

import './/screens/home/home_screen.dart';
import './/screens/Favourites/favourites_screen.dart';
import './/screens/BookedVehicles/booked_vehicles_screen.dart';
import './/screens/user/user_screen.dart';
import './/components/constants.dart';

class MainScreen extends StatefulWidget {
  final userId;

  const MainScreen({Key? key, required this.userId}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List pageList = [
    HomeScreen(),
    FavouritesScreen(),
    BookedVehiclesScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: pageList[pageIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.shifting,
        //type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 30,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.white54,
        ),
        //unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
            ),
            label: "Favourites",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_rounded,
            ),
            label: "Booked Vehicles",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
            backgroundColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
