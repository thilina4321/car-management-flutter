import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'body.dart';
import './/components/constants.dart';
import 'navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        // leading: IconButton(
        //   icon: SvgPicture.asset("assets/icons/menu.svg"),
        //   onPressed: () {},
        // ),
      ),
      body: Body(),
      drawer: NavDrawer(),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
