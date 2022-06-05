import 'package:dio/dio.dart';
import 'package:ds_rent_cars/util/user.dart';
import 'package:flutter/material.dart';

import './/components/constants.dart';
import './/components/vehicle_data.dart';
import './/screens/components/vehicle_card_rectangle_box.dart';

class RecommendedCarsScreen extends StatefulWidget {
  @override
  State<RecommendedCarsScreen> createState() => _RecommendedCarsScreenState();
}

class _RecommendedCarsScreenState extends State<RecommendedCarsScreen> {
  var recommandedCars = [];
  final List<Cars> getCarsList = [];

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();
  String userId = '';

  Future<void> fetchFeatured() async {
    try {
      var recCars = await dio.get('$url/cars/recommanded');

      List cars = recCars.data["cars"];
      setState(() {
        recommandedCars = cars;
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    fetchFeatured();
    userId = UserDataForShare().getUserId;
    super.initState();
  }

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
          children: recommandedCars
              .map((car) => VehicleCard(
                    id: car['id'],
                    title: car["vehicleName"],
                    year: car["year"],
                    price: car["price"],
                    description: car["description"],
                    transmission: car['transmission'],
                    seats: car['seats'],
                    ac: car['ac'],
                    fuelType: car['fuelType'],
                    fav: car['fav'],
                  ))
              .toList()
          // [
          //   VehicleCard(title: "", year: "",price: "",),

          // ],
          ),
    );
  }
}
