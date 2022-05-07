import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/vehicle_data.dart';
import './/screens/VehicleDetails/details_screen.dart';

class FeaturedCars extends StatelessWidget {
  final List<Cars> getCarsList = [
    Cars(
      title: "Acura",
      price: 44000,
      image: "assets/images/acura_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Land Rover",
      price: 70000,
      image: "assets/images/land_rover_0.png",
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getCarsList.map((tx) {
          return Row(
            children: <Widget>[
              FeaturedCarCard(
                image: tx.image,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class FeaturedCarCard extends StatelessWidget {
  final String image;
  final VoidCallback press;

  FeaturedCarCard({
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              child: Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2,
        ),
        width: size.width * 0.55,
        height: size.height * 0.30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            //fit: BoxFit.cover,
            image: AssetImage(image),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              color: kPrimaryColor.withOpacity(0.15),
            ),
          ],
        ),
      ),
    );
  }
}
