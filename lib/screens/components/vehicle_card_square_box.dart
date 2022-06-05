import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/screens/VehicleDetails/details_screen.dart';

class VehicleCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final String year;
  final String description;
  final String seats;
  final String ac;
  final String fuelType;
  final String transmission;
  final List fav;
  final String id;
  final Function makeCarFav;

  VehicleCard({
    required this.title,
    required this.price,
    required this.image,
    required this.year,
    required this.description,
    required this.seats,
    required this.ac,
    required this.fuelType,
    required this.transmission,
    required this.makeCarFav,
    required this.fav,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              title: title,
              id: id,
              price: price,
              year: year,
              description: description,
              transmission: transmission,
              seats: seats,
              fuelType: fuelType,
              ac: ac,
              fav: fav,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: size.width * 0.45,
            height: size.height * 0.135,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(image),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 15,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.45,
            height: size.height * 0.075,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Rs " + price.toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "/days",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey[500],
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    makeCarFav(id);
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: kSecondaryColor,
                    size: 25,
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
