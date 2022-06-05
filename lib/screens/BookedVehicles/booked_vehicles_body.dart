import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'booked_vehicles_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var bookedCarsArr = [];
  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();

  Future<void> fetchBooked() async {
    try {
      var bookedCars = await dio.get('$url/cars/booked');

      List cars = bookedCars.data["data"];
      setState(() {
        cars.forEach((element) {
          if (element['userId'] == userId) {
            bookedCarsArr.add(element);
          }
        });
      });
    } catch (e) {
      throw e;
    }
  }

  String userId = '';

  Future<void> cancelOrder(id, carId) async {
    try {
      await dio.delete('$url/cars/booked/$id/$carId');

      setState(() {
        var findVal =
            bookedCarsArr.firstWhere((element) => element['carId'] == carId);
        bookedCarsArr.remove(findVal);
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> getUserId() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var user = prefs.getString('user');
    if (user != null) {
      userId = user as String;
    }
  }

  @override
  void initState() {
    fetchBooked();
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    print(bookedCarsArr);
    return ListView(
        children: bookedCarsArr
            .map((car) => BookedVehiclesCard(
                  id: car["_id"],
                  image: "assets/images/honda_0.png",
                  title: car["carName"],
                  time: "5 Days to arrival",
                  price: car["price"],
                  carId: car['carId'],
                  description: "",
                  year: "",
                  fav: [],
                  cancelOrder: (id, carId) => cancelOrder(id, carId),
                ))
            .toList());
  }
}
