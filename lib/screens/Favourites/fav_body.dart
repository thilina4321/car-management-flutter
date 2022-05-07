import 'package:ds_rent_cars/components/constants.dart';
import 'package:flutter/material.dart';

import './/screens/components/vehicle_card_square_box.dart';

class FavBody extends StatelessWidget {
  const FavBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(
        kDefaultPadding / 2,
      ),
      children: [
        VehicleCard(
          title: "Camaro",
          price: 250,
          image: "assets/images/camaro_0.png",
        ),
        VehicleCard(
          title: "Acura SUV",
          price: 400,
          image: "assets/images/acura_0.png",
        ),
        VehicleCard(
          title: "Ferrari 488",
          price: 800,
          image: "assets/images/ferrari_spider_488_0.png",
        ),
        VehicleCard(
          title: "Nissan GTR",
          price: 200,
          image: "assets/images/nissan_gtr_0.png",
        ),
        VehicleCard(
          title: "Fiat",
          price: 100,
          image: "assets/images/fiat_1.png",
        ),
        VehicleCard(
          title: "Honda CIVIC",
          price: 150,
          image: "assets/images/honda_0.png",
        ),
        VehicleCard(
          title: "Land Rover",
          price: 300,
          image: "assets/images/land_rover_0.png",
        ),
        VehicleCard(
          title: "Citroen",
          price: 150,
          image: "assets/images/citroen_0.png",
        ),
      ],
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
