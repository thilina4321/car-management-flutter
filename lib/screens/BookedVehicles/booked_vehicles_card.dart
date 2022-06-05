import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/screens/VehicleDetails/details_screen.dart';

class BookedVehiclesCard extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final int price;
  final String year;
  final String description;
  final List fav;
  final Function cancelOrder;
  final String id;
  final String carId;

  BookedVehiclesCard({
    required this.image,
    required this.title,
    required this.time,
    required this.price,
    required this.description,
    required this.year,
    required this.fav,
    required this.cancelOrder,
    required this.id,
    required this.carId,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: kPrimaryColor.withOpacity(0.2),
      highlightColor: kPrimaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        margin: EdgeInsets.all(
          size.width * 0.04,
        ),
        padding: EdgeInsets.only(
          top: size.width * 0.02,
          bottom: size.width * 0.02,
          // top: kDefaultPadding / 2,
          // bottom: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 15,
              color: kPrimaryColor.withOpacity(0.15),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.35,
              margin: EdgeInsets.only(
                right: size.width * 0.02,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.005),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Text(
                    "Rs " + price.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          cancelOrder(id, carId);
                        },
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.24,
                          margin: EdgeInsets.only(
                            right: size.width * 0.02,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Cancel Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
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
    );
  }
}
