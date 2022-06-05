import 'package:flutter/material.dart';

import '../../components/constants.dart';

class VehicleInfoCard extends StatelessWidget {
  final String vehicleName;
  final String image;
  final String year;
  final int price;
  final String description;
  final String transmission;
  final String fuelType;
  final String seats;
  final String ac;
  final VoidCallback showBottomSheet;

  VehicleInfoCard({
    required this.vehicleName,
    required this.image,
    required this.year,
    required this.price,
    required this.description,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.ac,
    required this.showBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(75),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: size.width * 0.18,
                  left: size.width * 0.08,
                  // top: 70,
                  // left: 30,
                  child: Container(
                    height: size.height * 0.25,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      image: DecorationImage(
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    // left: kDefaultPadding,
                    // top: 15,
                    left: size.width * 0.04,
                    top: size.width * 0.03,
                  ),
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicleName,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            year.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
            ),
            height: size.height * 0.1,
            margin: EdgeInsets.only(
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              // top: kDefaultPadding / 2,
              // bottom: kDefaultPadding / 2,
            ),
            //color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VehicleConditionsIcon(
                  iconImage: "assets/icons/gear.png",
                  type: transmission,
                ),
                VehicleConditionsIcon(
                  iconImage: "assets/icons/gas-station.png",
                  type: fuelType,
                ),
                VehicleConditionsIcon(
                  iconImage: "assets/icons/car-chair.png",
                  type: seats,
                ),
                VehicleConditionsIcon(
                  iconImage: "assets/icons/ac icon.png",
                  type: ac,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                  ),
                  height: size.height * 0.045,
                  width: size.width,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.2935,
                  padding: EdgeInsets.only(
                    top: size.width * 0.04,
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                  ),
                  margin: EdgeInsets.only(
                    bottom: size.width * 0.04,
                  ),
                  width: size.width,
                  child: RichText(
                    text: TextSpan(
                      text: description,
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.065,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: size.width * 0.04,
                  ),
                  width: size.width * 0.5,
                  child: Row(
                    children: [
                      Text(
                        "Rs " + price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        "\/day",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: showBottomSheet,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.06,
                      right: size.width * 0.02,
                      top: size.width * 0.015,
                      bottom: size.width * 0.02,
                    ),
                    width: size.width * 0.45,
                    height: size.height * 0.1,
                    child: Text(
                      "Book Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleConditionsIcon extends StatelessWidget {
  final String iconImage;
  final String type;

  VehicleConditionsIcon({
    required this.iconImage,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        //alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.03,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.width * 0.064,
              // top: 12,
              // left: 20,
              // right: 20,
              // bottom: 25,
            ),
            width: size.width * 0.1,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconImage),
              ),
            ),
          ),
          Positioned(
            bottom: size.width * 0.02,
            // bottom: 8,
            width: size.width * 0.2,
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
