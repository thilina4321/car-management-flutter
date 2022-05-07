import 'package:ds_rent_cars/components/constants.dart';
import 'package:flutter/material.dart';

import 'booked_vehicles_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BookedVehiclesCard(
          image: "assets/images/honda_0.png",
          title: "Honda CIVIC",
          time: "5 Days to arrival",
          price: 200,
        ),
        BookedVehiclesCard(
          image: "assets/images/camaro_0.png",
          title: "Chevrolet Camaro",
          time: "3 Days to arrival",
          price: 400,
        ),
        BookedVehiclesCard(
          image: "assets/images/fiat_1.png",
          title: "Fiat",
          time: "6 Days to arrival",
          price: 200,
        ),
        BookedVehiclesCard(
          image: "assets/images/ferrari_spider_488_0.png",
          title: "Ferrari 488",
          time: "8 Days to arrival",
          price: 1000,
        ),
        BookedVehiclesCard(
          image: "assets/images/acura_0.png",
          title: "Acura SUV",
          time: "3 Days to arrival",
          price: 300,
        ),
      ],
    );
  }
}
