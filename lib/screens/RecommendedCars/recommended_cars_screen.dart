import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/components/vehicle_data.dart';
import './/screens/components/vehicle_card_rectangle_box.dart';

class RecommendedCarsScreen extends StatelessWidget {
  final List<Cars> getCarsList = [
    Cars(
      title: "Acura",
      price: 44000,
      image: "assets/images/acura_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Camaro",
      price: 80000,
      image: "assets/images/camaro_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Land Rover",
      price: 70000,
      image: "assets/images/land_rover_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Ferrari 488",
      price: 200000,
      image: "assets/images/ferrari_spider_488_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Nissan GTR",
      price: 60000,
      image: "assets/images/nissan_gtr_0.png",
      //pressAction: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: size.height * 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: kDefaultPadding / 2,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.all(
                    kDefaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Recommended ',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Cars',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          VehicleCard(),
          VehicleCard(),
          VehicleCard(),
          VehicleCard(),
          VehicleCard(),
        ],
      ),
    );
  }
}
