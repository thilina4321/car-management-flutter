import 'package:flutter/material.dart';

import './/components/constants.dart';
import 'info_bars.dart';
import 'user_avatar.dart';
import 'user_name.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.365,
            width: size.width,
            margin: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
              bottom: size.width * 0.04,
            ),
            child: Column(
              children: [
                UserAvatar(size: size, image: "assets/user avatar/avatar.png"),
                UserName(
                  size: size,
                  fNameAndLastName: "Kanisha Liyanage",
                  userName: "KanishaL",
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size.width * 0.009,
                        // top: 6,
                        // bottom: 5,
                      ),
                      child: Text(
                        "Edit Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProfileInfoBars(
            size: size,
            title: "Billing Details",
            iconname: Icon(Icons.account_balance_rounded),
          ),
          ProfileInfoBars(
            size: size,
            title: "My Booked Vehicles",
            iconname: Icon(Icons.bookmark_add_rounded),
          ),
          ProfileInfoBars(
            size: size,
            title: "Card Details",
            iconname: Icon(Icons.credit_card_rounded),
          ),
          ProfileInfoBars(
            size: size,
            title: "Log out",
            iconname: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
