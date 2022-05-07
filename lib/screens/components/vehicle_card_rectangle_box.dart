import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/screens/VehicleDetails/details_screen.dart';

class VehicleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: kPrimaryColor.withOpacity(0.2),
      highlightColor: kPrimaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            margin: EdgeInsets.all(
              size.width * 0.04,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ],
            ),
          ),
          Positioned(
            left: 196,
            top: 28,
            child: Container(
              width: size.width * 0.45,
              height: size.height * 0.18,
              decoration: BoxDecoration(
                //color: Colors.amber,
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(
                    "assets/images/acura_0.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.width * 0.065,
            left: size.width * 0.08,
            // top: 40,
            // left: 20,
            child: Container(
              height: size.height * 0.13,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Honda Acura SUV",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.width * 0.005),
                  Text(
                    "2018",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: size.width * 0.005),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Rs 200/",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        TextSpan(
                          text: "day",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // top: 147.5,
            // left: 20,
            top: size.width * 0.33,
            left: size.width * 0.04,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
              child: Container(
                child: Text(
                  "Book Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                height: size.height * 0.05,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
