import 'package:flutter/material.dart';

import 'body.dart';
import './/components/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InfoScreenAppBar(context),
      body: VehicleInfoBody(),
    );
  }

  AppBar InfoScreenAppBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: Container(
        padding: EdgeInsets.only(
          top: size.width * 0.02,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            top: size.width * 0.02,
          ),
          margin: EdgeInsets.only(
            right: kDefaultPadding / 2,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
