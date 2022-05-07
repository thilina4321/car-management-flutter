import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/screens/User/user_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Material(
        color: kPrimaryColor,
        child: ListView(
          children: [
            ProfileTile(size: size),
            //Divider(color: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "Favourites",
                iconName: Icon(Icons.favorite_border_rounded),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "Booked Vehicles",
                iconName: Icon(Icons.shopping_cart_rounded),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "notifications",
                iconName: Icon(Icons.notifications_active_rounded),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "chat",
                iconName: Icon(Icons.chat_bubble_rounded),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "Settings",
                iconName: Icon(Icons.settings),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "Updates",
                iconName: Icon(Icons.update_rounded),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: MenuItems(
                title: "Log Out",
                iconName: Icon(Icons.logout_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Size size;
  const ProfileTile({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(),
          ),
        );
      },
      child: Container(
        height: size.height * 0.15,
        margin: EdgeInsets.only(
          top: size.width * 0.04,
          bottom: size.width * 0.04,
          left: size.width * 0.02,
          right: 8,
        ),
        child: Row(
          children: [
            SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.25,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 47,
                  backgroundColor: kPrimaryColor,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage("assets/user avatar/avatar.png"),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.15,
              width: size.width * 0.4,
              padding: EdgeInsets.only(
                top: size.width * 0.02,
                bottom: size.width * 0.01,
                left: size.width * 0.02,
                // top: 30,
                // left: 10,
                // bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kanisha Liyanage",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "@KanishaLiyanage",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  final String title;
  final Icon iconName;

  const MenuItems({
    required this.title,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconName.icon,
        color: Colors.white,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onTap: () {},
    );
  }
}
