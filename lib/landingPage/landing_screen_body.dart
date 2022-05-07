import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'welcome_screen.dart';

class Body extends StatelessWidget {
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      controller: pageController,
      children: [
        WelcomePage(pageController: pageController),
        LoginScreen(),
      ],
    );
  }
}
