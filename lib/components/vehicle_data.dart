import 'package:flutter/material.dart';

class Cars {
  final String title;
  final int price;
  final String image;
  //final VoidCallback pressAction;

  Cars({
    required this.title,
    required this.price,
    required this.image,
    //required this.pressAction,
  });
}

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
